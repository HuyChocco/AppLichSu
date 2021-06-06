import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PostDetail extends StatefulWidget {
  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  final _controller = new TextEditingController();

  bool _isInit = true;

  String _idPost;
  void _sendMessage() async {
    FocusScope.of(context).unfocus();

    final user = FirebaseAuth.instance.currentUser;

    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    FirebaseFirestore.instance
        .collection('comments')
        .doc(_idPost)
        .collection('comment')
        .add({
      'text': _controller.text,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData.data()['username'],
      'userImage': userData.data()['image_url']
    });
    _controller.clear();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      if (ModalRoute.of(context).settings.arguments == null) return;
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      _idPost = routeArgs['idPost'];
      print(_idPost);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(children: [
            Column(
              children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('discussion')
                        .doc(_idPost)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final post = snapshot.data;
                      final Timestamp t = post['createdAt'];
                      DateTime d =
                          DateTime.fromMillisecondsSinceEpoch(t.seconds * 1000);
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(post['userImage'])),
                              title: Text(
                                post['username'],
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              subtitle: Text(
                                d.toString(),
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ),
                            FittedBox(
                                child: Text(
                              post['text'],
                              style: TextStyle(
                                fontFamily: 'Nunito',
                              ),
                            )),
                            if (post['imageUpload'] != '' ||
                                post['videoUpload'] != '')
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (post['imageUpload'] != '')
                                    Container(
                                      width: 200,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                        post['imageUpload'],
                                      ))),
                                    ),
                                  if (post['videoUpload'] != '')
                                    if (post['imageUpload'] != '')
                                      Expanded(
                                        child: VideoPlayerScreen(
                                            key: ValueKey(post.id),
                                            url: post['videoUpload']),
                                      )
                                    else
                                      VideoPlayerScreen(
                                          // key: ValueKey(discusDocs[index].id),
                                          url: post['videoUpload']),
                                ],
                              ),
                          ],
                        ),
                      );
                    }),
                SizedBox(height: 20),
                Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('comments')
                          .doc(_idPost)
                          .collection('comment')
                          .orderBy(
                            'createdAt',
                            descending: true,
                          )
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final commentDocs = snapshot.data.docs;

                        return ListView.builder(
                            itemCount: commentDocs.length,
                            itemBuilder: (_, index) {
                              final Timestamp t =
                                  commentDocs[index].data()['createdAt'];
                              DateTime d = DateTime.fromMillisecondsSinceEpoch(
                                  t.seconds * 1000);
                              return Card(
                                key: ValueKey(commentDocs[index].id),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              commentDocs[index]
                                                  .data()['userImage'])),
                                      title: Text(
                                        commentDocs[index].data()['username'],
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                      subtitle: Text(
                                        d.toString(),
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      commentDocs[index].data()['text'],
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 350, maxHeight: 100),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'Nhập câu trả lời ...',
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
                      onPressed:
                          _controller.text.trim().isEmpty ? null : _sendMessage,
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
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
