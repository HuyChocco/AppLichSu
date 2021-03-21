import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:hisapp/components/custom_bottom_nav_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:hisapp/constants.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  String _link = "";
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    //if (Platform.isWindows) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context).settings.arguments == null) return;
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    _link = routeArgs['link'];
    super.didChangeDependencies();
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thông báo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Vui lòng kiểm tra kết nối mạng.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: buildAppBar(context, title: "New Events"),
      appBar: AppBar(
          title: Text(
            'Các sự kiện lịch sử',
            style: TextStyle(
              color: kTextColor,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              //color: Colors.red,
            ),
            color: kIconColor,
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.replay),
                color: kIconColor,
                onPressed: () {
                  _controller.future.then((value) => value.reload());
                }),
            IconButton(
                icon: Icon(Icons.arrow_back),
                color: kIconColor,
                onPressed: () {
                  _controller.future.then((value) => value.goBack());
                }),
            IconButton(
                icon: Icon(Icons.arrow_forward),
                color: kIconColor,
                onPressed: () async {
                  await _controller.future.then((value) => value.goForward());
                }),
          ]),
      //body: Body(),
      body: Stack(children: [
        WebView(
          initialUrl: '$_link',
          javascriptMode: JavascriptMode.unrestricted,
          onWebResourceError: (error) => _showMyDialog(),
          onPageStarted: (str) {
            setState(() {
              _isLoading = true;
            });
            _controller.future.then((value) => value.evaluateJavascript(
                'Toaster.postMessage("User Agent: " + navigator.userAgent);'));
          },
          javascriptChannels: {
            JavascriptChannel(
                name: 'Toaster',
                onMessageReceived: (mess) {
                  print(mess.message);
                })
          },
          onPageFinished: (str) {
            setState(() {
              _isLoading = false;
            });
          },
          //gestureNavigationEnabled: true,
          navigationDelegate: (NavigationRequest request) {
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
        _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(),
      ]),
      //bottomNavigationBar: CustomBottonNavBar(),
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (ctx, snapshot) {
          if (snapshot.hasData)
            return FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(content: Text('Làm bài kiểm tra nhé')),
                );
                Navigator.of(context).pushNamed('/quiz-screen');
              },
              child: Icon(
                Icons.check,
              ),
            );
          else
            return Container();
        },
      ),
    );
  }
}
