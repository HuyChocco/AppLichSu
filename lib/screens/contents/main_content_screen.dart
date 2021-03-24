import 'package:flutter/material.dart';
import 'package:hisapp/providers/ContentProvider.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class MainContentScreen extends StatefulWidget {
  @override
  _MainContentScreenState createState() => _MainContentScreenState();
}

class _MainContentScreenState extends State<MainContentScreen> {
  String _imagePath;

  String _filePath;

  bool _isInit = true;

  String _content = "";

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      if (ModalRoute.of(context).settings.arguments == null) return;
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      _imagePath = routeArgs['imagePath'];
      print(_imagePath);
      _filePath = routeArgs['filePath'];
      print(_filePath);
      final ContentProvider provide_content =
          Provider.of<ContentProvider>(context, listen: false);
      await provide_content.loadTextFromFile(_filePath);
      print(provide_content.MainContents.length);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.close,
            ),
            color: kIconColor,
            onPressed: () => Navigator.of(context).pop(),
          ),
          /* title: Text(
            "Nội dung chính",
          ), */
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(children: [
          Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.grey)),
                child: Text("Nhấp để tiếp tục"),
              )),
          FutureBuilder(
              future: Provider.of<ContentProvider>(context, listen: false)
                  .loadTextFromFile(_filePath),
              builder: (ctx, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Consumer<ContentProvider>(
                          builder: (ctx, data, ch) => ListView.builder(
                              itemCount: data.MainContents.length,
                              itemBuilder: (ctx, index) {
                                return Column(children: [
                                  Text(data.MainContents[index],
                                      style: kTitleTextStyle),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]);
                              }))),
        ]));
  }
}
