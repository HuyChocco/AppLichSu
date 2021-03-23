import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

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
  void didChangeDependencies() {
    if (_isInit) {
      if (ModalRoute.of(context).settings.arguments == null) return;
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      _imagePath = routeArgs['imagePath'];
      print(_imagePath);
      _filePath = routeArgs['filePath'];
      print(_filePath);
      rootBundle.loadString(_filePath).then((value) => setState(() {
            _content = value;
          }));
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nội dung chính"),
        ),
        body: Text(
          _content,
        ));
  }
}
