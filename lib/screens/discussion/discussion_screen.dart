import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hisapp/screens/splash_screen.dart';
import 'package:hisapp/widgets/login/login_screen.dart';
import 'package:hisapp/widgets/signup/signup_screen.dart';

import '../../constants.dart';

class DiscussionScreen extends StatefulWidget {
  @override
  _DiscussionScreenState createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  bool _isLogin = false;

  var _pageViewController = PageController();
  void _logOut() async {
    final _auth = FirebaseAuth.instance;
    await _auth.signOut();
  }

  final _controller = new TextEditingController();
  //var _enteredMessage = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();

    final user = FirebaseAuth.instance.currentUser;

    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    FirebaseFirestore.instance.collection('discussion').add({
      'text': _controller.text,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData.data()['username'],
      'userImage': userData.data()['image_url'],
      'likes': 0,
    });
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
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Theme.of(context).accentColor),
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
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red)),
                                    onPressed: _logOut,
                                    child: Text("Đăng xuất"),
                                  ),
                                  ElevatedButton(
                                    onPressed: _showBottomForm,
                                    child: Text("Đăng câu hỏi"),
                                  ),
                                  SizedBox(height: 20),
                                  Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.9),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(60),
                                            topRight: Radius.circular(60),
                                          ),
                                        ),
                                        child: Column(children: [
                                          SizedBox(
                                            height: 80,
                                          ),
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
                                                        return Card(
                                                          key: ValueKey(
                                                              discusDocs[index]
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
                                                                          discusDocs[index]
                                                                              .data()['userImage']),
                                                                ),
                                                                title: Text(
                                                                  discusDocs[index]
                                                                          .data()[
                                                                      'username'],
                                                                ),
                                                                subtitle: Text(d
                                                                    .toString()),
                                                              ),
                                                              Text(
                                                                discusDocs[index]
                                                                        .data()[
                                                                    'text'],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  StreamBuilder(
                                                                      stream: FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              'userFavorites')
                                                                          .doc(user
                                                                              .uid)
                                                                          .snapshots(),
                                                                      builder:
                                                                          (context,
                                                                              snaps) {
                                                                        if (snaps.connectionState ==
                                                                            ConnectionState.waiting) {
                                                                          return Center(
                                                                            child:
                                                                                CircularProgressIndicator(),
                                                                          );
                                                                        }
                                                                        var data;
                                                                        if (snaps
                                                                            .hasData) {
                                                                          data =
                                                                              snaps.data;
                                                                        }

                                                                        IconData
                                                                            icon =
                                                                            Icons.favorite_border_outlined;
                                                                        if (data ==
                                                                            null)
                                                                          icon =
                                                                              Icons.favorite_border_outlined;
                                                                        else {
                                                                          if (data.data() !=
                                                                              null) {
                                                                            if (data.data()[discusDocs[index].id] ==
                                                                                true)
                                                                              icon = Icons.favorite;
                                                                            else
                                                                              icon = Icons.favorite_border_outlined;
                                                                          }
                                                                        }
                                                                        return IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            _doUpdatePostStatus(discusDocs[index].id,
                                                                                icon);
                                                                          },
                                                                          icon:
                                                                              Icon(
                                                                            icon,
                                                                            color:
                                                                                Colors.red,
                                                                          ),
                                                                        );
                                                                      }),
                                                                  Text(discusDocs[
                                                                          index]
                                                                      .data()[
                                                                          'likes']
                                                                      .toString()),
                                                                  IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context).pushNamed(
                                                                            '/post-detail',
                                                                            arguments: {
                                                                              'idPost': discusDocs[index].id.toString(),
                                                                            });
                                                                      },
                                                                      icon: Icon(
                                                                          Icons
                                                                              .chat_outlined)),
                                                                  StreamBuilder(
                                                                      stream: FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              'comments')
                                                                          .doc(discusDocs[index]
                                                                              .id)
                                                                          .collection(
                                                                              'comment')
                                                                          .snapshots(),
                                                                      builder: (ctx,
                                                                          data) {
                                                                        if (data.connectionState ==
                                                                            ConnectionState.waiting) {
                                                                          return Center(
                                                                            child:
                                                                                CircularProgressIndicator(),
                                                                          );
                                                                        }
                                                                        return Text(data
                                                                            .data
                                                                            .docs
                                                                            .length
                                                                            .toString());
                                                                      }),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
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
                              Text("Bạn chưa đăng nhập"),
                              ElevatedButton(
                                onPressed: _showBottomSheetDialog,
                                child: Text("Đăng nhập"),
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
