import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                              title: Text(post['username']),
                              subtitle: Text(d.toString()),
                            ),
                            FittedBox(child: Text(post['text'])),
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
                                      title: Text(commentDocs[index]
                                          .data()['username']),
                                      subtitle: Text(d.toString()),
                                    ),
                                    Text(commentDocs[index].data()['text']),
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
