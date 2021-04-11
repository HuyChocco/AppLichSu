import 'package:flutter/material.dart';

class PostDetail extends StatefulWidget {
  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  final _controller = new TextEditingController();
  void _sendMessage() {}
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
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading:
                            CircleAvatar(backgroundImage: NetworkImage("")),
                        title: Text("Hello"),
                        subtitle: Text("xxx"),
                      ),
                      FittedBox(child: Text("discusDocs[index]")),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (_, index) => Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text("user"),
                          )
                        ],
                      ),
                    ),
                  ),
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
                constraints: BoxConstraints(maxWidth: 400, maxHeight: 100),
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
