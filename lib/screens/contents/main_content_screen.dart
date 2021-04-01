import 'package:flutter/material.dart';
import 'package:hisapp/providers/ContentProvider.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../constants.dart';

class MainContentScreen extends StatefulWidget {
  @override
  _MainContentScreenState createState() => _MainContentScreenState();
}

class _MainContentScreenState extends State<MainContentScreen> {
  String _imagePath;

  String _filePath;

  String _videoPath;

  bool _isInit = true;

  String _content = "";
  String _id;

  int _length_list = 0;

  int _number_item_list = 0;
  PageController _pageController;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  String videoId;
  YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  @override
  void initState() {
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;

    _pageController = PageController();
    super.initState();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  void _increaseListLength() {
    print(_length_list);
    setState(() {
      if (_number_item_list < _length_list) _number_item_list++;
    });
  }

  void _showBottomSheetDialog() {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (ctx) => Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      width: 150,
                      height: 150,
                      image: AssetImage("assets/images/congrats.gif")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          onPressed: () {
                            Navigator.of(context).pop();
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 250),
                                curve: Curves.ease);
                          },
                          child: Text('Xem video')),
                      ElevatedButton(
                          onPressed: () {
                            _controller.pause();
                            Navigator.of(context).pushNamed('/quiz-screen',
                                arguments: {'idContent': _id});
                          },
                          child: Text('Làm bài kiểm tra')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Đọc lại lần nữa')),
                    ],
                  )
                ],
              ),
            ));
  }

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      if (ModalRoute.of(context).settings.arguments == null) return;
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      _id = routeArgs['id'];
      print(_id);
      _imagePath = routeArgs['imagePath'];
      print(_imagePath);
      _videoPath = routeArgs['videoPath'];
      print(_videoPath);
      videoId = YoutubePlayer.convertUrlToId(_videoPath);
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      )..addListener(listener);
      _filePath = routeArgs['filePath'];
      print(_filePath);
      final ContentProvider provide_content =
          Provider.of<ContentProvider>(context, listen: false);
      await provide_content.loadTextFromFile(_filePath);
      _length_list = provide_content.MainContents.length;
      if (_length_list > 0)
        setState(() {
          _number_item_list = 1;
        });
      print(_number_item_list);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
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
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 250,
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: 2,
                  itemBuilder: (ctx, index) => index == 0
                      ? Image.asset(_imagePath)
                      : YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.amber,
                          onReady: () {
                            _isPlayerReady = true;
                          },
                        ),
                ),
              ),

              //Image.asset(_imagePath),
              Expanded(
                child: Stack(children: [
                  //FutureBuilder(
                  /* future: Provider.of<ContentProvider>(context, listen: false)
                          .loadTextFromFile(_filePath),
                      builder: (ctx, snapshot) =>
                          snapshot.connectionState == ConnectionState.waiting
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              :  */
                  Consumer<ContentProvider>(
                      builder: (ctx, data, ch) => Container(
                            margin: EdgeInsets.only(bottom: 60),
                            child: ListView.builder(
                                itemCount: _number_item_list,
                                itemBuilder: (ctx, index) {
                                  return Column(children: [
                                    Text(data.MainContents[index],
                                        style: kSubtitleTextStyle),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ]);
                                }),
                          )),
                  // ),
                  Positioned(
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: TextButton(
                        onPressed: () {
                          if (_number_item_list != _length_list)
                            _increaseListLength();
                          else {
                            _showBottomSheetDialog();
                          }
                        },
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor: MaterialStateProperty.all(
                                _number_item_list == _length_list
                                    ? Colors.green[400]
                                    : Colors.grey)),
                        child: Text(_number_item_list == _length_list
                            ? "Đọc xong"
                            : "Nhấp để đọc tiếp"),
                      )),
                ]),
              ),
            ],
          ),
        ));
  }
}
