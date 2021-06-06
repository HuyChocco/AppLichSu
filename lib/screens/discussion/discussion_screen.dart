import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hisapp/screens/splash_screen.dart';
import 'package:hisapp/widgets/login/login_screen.dart';
import 'package:hisapp/widgets/pickers/multiple_image_picker.dart';
import 'package:hisapp/widgets/signup/signup_screen.dart';
import 'package:video_player/video_player.dart';

import '../../constants.dart';

class DiscussionScreen extends StatefulWidget {
  @override
  _DiscussionScreenState createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  bool _isLogin = false;

  var _pageViewController = PageController();

  File _userImageFile;
  File _userVideoFile;

  void _pickedImage(File image, File video) {
    _userImageFile = image;
    _userVideoFile = video;
  }

  void _logOut() async {
    final _auth = FirebaseAuth.instance;
    await _auth.signOut();
  }

  final _controller = new TextEditingController();
  //var _enteredMessage = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();

    final user = FirebaseAuth.instance.currentUser;
    String imageUrl = '';
    String videoUrl = '';
    final DateTime now = DateTime.now();
    final int millSeconds = now.millisecondsSinceEpoch;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    if (_userVideoFile != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child('user_data')
          .child(user.uid + now.toString() + '.mp4');
      // Create your custom metadata.
      SettableMetadata metadata = SettableMetadata(
        contentType: 'video/mp4',
      );
      await ref.putFile(_userVideoFile, metadata);
      videoUrl = await ref.getDownloadURL();
    }
    if (_userImageFile != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child('user_data')
          .child(user.uid + now.toString() + '.jpg');

      await ref.putFile(_userImageFile);
      imageUrl = await ref.getDownloadURL();
    }
    FirebaseFirestore.instance.collection('discussion').add({
      'text': _controller.text,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData.data()['username'],
      'userImage': userData.data()['image_url'],
      'likes': 0,
      'imageUpload': imageUrl,
      'videoUpload': videoUrl,
    });
    _userImageFile = null;
    _userVideoFile = null;
    _controller.clear();
    Navigator.of(context).pop();
  }

  int likes = 0;
  void _doUpdatePostStatus(String id, IconData icon) async {
    final user = FirebaseAuth.instance.currentUser;
    bool _isLike = false;
    if (icon == Icons.favorite_border_outlined)
      _isLike = true;
    else
      _isLike = false;
    if (_isLike) {
      await FirebaseFirestore.instance
          .collection('userFavorites')
          .doc(user.uid)
          .set({id: _isLike}, SetOptions(merge: true));
      final post = await FirebaseFirestore.instance
          .collection('discussion')
          .doc(id)
          .get();
      likes = post['likes'];
      if (_isLike) likes++;
    } else {
      await FirebaseFirestore.instance
          .collection('userFavorites')
          .doc(user.uid)
          .set({id: _isLike}, SetOptions(merge: true));
      final post = await FirebaseFirestore.instance
          .collection('discussion')
          .doc(id)
          .get();
      likes = post['likes'];
      if (likes > 0) likes--;
    }
    await FirebaseFirestore.instance
        .collection('discussion')
        .doc(id)
        .update({'likes': likes});
  }

  void _showBottomForm() async {
    showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (ctx) => Container(
              decoration: BoxDecoration(
                  //gradient: kPrimaryGradient,
                  ),
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      "CÂU HỎI",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Theme.of(context).accentColor,
                            fontFamily: 'Nunito',
                          ),
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            labelText: 'Nhập câu hỏi ...',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.red)),
                          ),
                          autocorrect: true,
                          enableSuggestions: true,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      IconButton(
                        color: Theme.of(context).primaryColor,
                        icon: Icon(
                          Icons.send,
                        ),
                        onPressed: _controller.text.trim().isEmpty
                            ? null
                            : _sendMessage,
                      )
                    ],
                  ),
                  MultipleImagePicker(_pickedImage),
                ],
              ),
            ));
  }

  void _showBottomSheetDialog() {
    if (!_isLogin)
      showModalBottomSheet(
          isDismissible: true,
          context: context,
          builder: (ctx) => PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => index == 0
                    ? LoginScreen(_pageViewController)
                    : SignUpScreen(_pageViewController),
                itemCount: 2,
                controller: _pageViewController,
              ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
        future: _initialization,
        builder: (context, appSnapshot) {
          return SafeArea(
            child: Scaffold(
              body: appSnapshot.connectionState != ConnectionState.done
                  ? SplashScreen()
                  : StreamBuilder(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final user = FirebaseAuth.instance.currentUser;
                          return Container(
                              decoration: BoxDecoration(
                                  // gradient: kPrimaryGradient,
                                  ),
                              width: double.infinity,
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    "Diễn đàn thảo luận lịch sử",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red)),
                                    onPressed: _logOut,
                                    child: Text(
                                      "Đăng xuất",
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: _showBottomForm,
                                    child: Text(
                                      "Đăng câu hỏi",
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        /*  decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.2),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(60),
                                            topRight: Radius.circular(60),
                                          ),
                                        ), */
                                        child: Column(children: [
                                          /* SizedBox(
                                            height: 80,
                                          ), */
                                          Expanded(
                                            child: StreamBuilder(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection('discussion')
                                                    .orderBy(
                                                      'createdAt',
                                                      descending: true,
                                                    )
                                                    .snapshots(),
                                                builder: (context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  }
                                                  final discusDocs =
                                                      snapshot.data.docs;
                                                  return ListView.builder(
                                                      itemCount:
                                                          discusDocs.length,
                                                      itemBuilder: (_, index) {
                                                        final Timestamp t =
                                                            discusDocs[index]
                                                                    .data()[
                                                                'createdAt'];
                                                        DateTime d = DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                t.seconds *
                                                                    1000);

                                                        return Column(
                                                          children: [
                                                            Card(
                                                              key: ValueKey(
                                                                  discusDocs[
                                                                          index]
                                                                      .id),
                                                              child: Column(
                                                                children: [
                                                                  ListTile(
                                                                    /* shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .circular(
                                                                                    10)), */
                                                                    leading:
                                                                        CircleAvatar(
                                                                      backgroundImage:
                                                                          NetworkImage(
                                                                              discusDocs[index].data()['userImage']),
                                                                    ),
                                                                    title: Text(
                                                                      discusDocs[index]
                                                                              .data()[
                                                                          'username'],
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Nunito',
                                                                      ),
                                                                    ),
                                                                    subtitle:
                                                                        Text(
                                                                      d.toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Nunito',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    discusDocs[index]
                                                                            .data()[
                                                                        'text'],
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Nunito',
                                                                    ),
                                                                  ),
                                                                  if (discusDocs[index].data()[
                                                                              'imageUpload'] !=
                                                                          '' ||
                                                                      discusDocs[index]
                                                                              .data()['videoUpload'] !=
                                                                          '')
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        if (discusDocs[index].data()['imageUpload'] !=
                                                                            '')
                                                                          Container(
                                                                            width:
                                                                                200,
                                                                            height:
                                                                                250,
                                                                            decoration: BoxDecoration(
                                                                                image: DecorationImage(
                                                                                    image: NetworkImage(
                                                                              discusDocs[index].data()['imageUpload'],
                                                                            ))),
                                                                          ),
                                                                        if (discusDocs[index].data()['videoUpload'] !=
                                                                            '')
                                                                          if (discusDocs[index].data()['imageUpload'] !=
                                                                              '')
                                                                            Expanded(
                                                                              child: VideoPlayerScreen(key: ValueKey(discusDocs[index].id), url: discusDocs[index].data()['videoUpload']),
                                                                            )
                                                                          else
                                                                            VideoPlayerScreen(
                                                                                // key: ValueKey(discusDocs[index].id),
                                                                                url: discusDocs[index].data()['videoUpload']),
                                                                      ],
                                                                    ),
                                                                  Row(
                                                                    children: [
                                                                      StreamBuilder(
                                                                          stream: FirebaseFirestore
                                                                              .instance
                                                                              .collection('userFavorites')
                                                                              .doc(user.uid)
                                                                              .snapshots(),
                                                                          builder: (context, snaps) {
                                                                            if (snaps.connectionState ==
                                                                                ConnectionState.waiting) {
                                                                              return Center(
                                                                                child: CircularProgressIndicator(),
                                                                              );
                                                                            }
                                                                            var data;
                                                                            if (snaps.hasData) {
                                                                              data = snaps.data;
                                                                            }

                                                                            IconData
                                                                                icon =
                                                                                Icons.favorite_border_outlined;
                                                                            if (data ==
                                                                                null)
                                                                              icon = Icons.favorite_border_outlined;
                                                                            else {
                                                                              if (data.data() != null) {
                                                                                if (data.data()[discusDocs[index].id] == true)
                                                                                  icon = Icons.favorite;
                                                                                else
                                                                                  icon = Icons.favorite_border_outlined;
                                                                              }
                                                                            }
                                                                            return IconButton(
                                                                              onPressed: () {
                                                                                _doUpdatePostStatus(discusDocs[index].id, icon);
                                                                              },
                                                                              icon: Icon(
                                                                                icon,
                                                                                color: Colors.red,
                                                                              ),
                                                                            );
                                                                          }),
                                                                      Text(
                                                                        discusDocs[index]
                                                                            .data()['likes']
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Nunito',
                                                                        ),
                                                                      ),
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pushNamed('/post-detail', arguments: {
                                                                              'idPost': discusDocs[index].id.toString(),
                                                                            });
                                                                          },
                                                                          icon:
                                                                              Icon(Icons.chat_outlined)),
                                                                      StreamBuilder(
                                                                          stream: FirebaseFirestore
                                                                              .instance
                                                                              .collection('comments')
                                                                              .doc(discusDocs[index].id)
                                                                              .collection('comment')
                                                                              .snapshots(),
                                                                          builder: (ctx, data) {
                                                                            if (data.connectionState ==
                                                                                ConnectionState.waiting) {
                                                                              return Center(
                                                                                child: CircularProgressIndicator(),
                                                                              );
                                                                            }
                                                                            return Text(
                                                                              data.data.docs.length.toString(),
                                                                              style: TextStyle(
                                                                                fontFamily: 'Nunito',
                                                                              ),
                                                                            );
                                                                          }),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 20),
                                                          ],
                                                        );
                                                      });
                                                }),
                                          ),
                                        ])),
                                  )
                                ],
                              ));
                        }
                        return Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Bạn chưa đăng nhập",
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              ElevatedButton(
                                onPressed: _showBottomSheetDialog,
                                child: Text(
                                  "Đăng nhập",
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
            ),
          );
        });
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final bool play;
  final String url;
  final key;
  VideoPlayerScreen({this.key, this.play, this.url}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create an store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      widget.url,
    );

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return Stack(children: [
            Container(
              width: 200,
              height: 200,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            ),
            Positioned(
              right: 5,
              top: 5,
              child: IconButton(
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    // If the video is playing, pause it.
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      // If the video is paused, play it.
                      _controller.play();
                    }
                  });
                },
                icon: Icon(_controller.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow),
              ),
            ),
          ]);
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Center(child: CircularProgressIndicator());
        }
      },
    );
    /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ), */
  }
}
