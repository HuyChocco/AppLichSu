import 'package:flutter/material.dart';
import 'package:hisapp/providers/ContentProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
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

  String _title;
  bool _isInit = true;

  String _content = "";
  String _id;
  String _idCate;

  int _length_list = 0;

  int _number_item_list = 0;
  ScrollController _scrollController = ScrollController();
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

  /* void _increaseListLength() {
    //print(_length_list);
    setState(() {
      if (_number_item_list < _length_list) _number_item_list++;
    });
  } */

  /*  void _showBottomSheetDialog() {
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
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 250),
                                curve: Curves.ease);
                            Navigator.of(context).pop();
                          },
                          child: Text('Xem video')),
                      ElevatedButton(
                          onPressed: () {
                            _controller.pause();
                            Navigator.of(context).pushNamed('/quiz-screen',
                                arguments: {
                                  'idContent': _id,
                                  'idCate': _idCate
                                });
                          },
                          child: Text('Làm bài kiểm tra')),
                      Expanded(
                        child: FittedBox(
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Đọc lại lần nữa')),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  } */

  @override
  void didChangeDependencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_isInit) {
      if (ModalRoute.of(context).settings.arguments == null) return;
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      _id = routeArgs['id'];
      prefs.setString('id', _id);
      print(_id);
      _idCate = routeArgs['idCate'];
      prefs.setString('id_cate', _idCate);
      print(_idCate);
      _imagePath = routeArgs['imagePath'];
      prefs.setString('image_path', _imagePath);
      print(_imagePath);
      _videoPath = routeArgs['videoPath'];
      prefs.setString('video_path', _videoPath);
      prefs.setString('is_loaded', 'ok');
      print(_videoPath);
      _title = routeArgs['title'];
      prefs.setString('title', _title);
      videoId = YoutubePlayer.convertUrlToId(_videoPath);
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      )..addListener(listener);
      _filePath = routeArgs['filePath'];
      prefs.setString('file_path', _filePath);
      print(_filePath);
      final ContentProvider provide_content =
          Provider.of<ContentProvider>(context, listen: false);
      await provide_content.loadTextFromFile(_filePath);
      //Sau khi load nội dung từ file txt
      _length_list = provide_content.MainContents.length;
      if (_length_list > 0)
        setState(() {
          _number_item_list = 1;
        });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  /* _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  } */

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
    //WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          color: kIconColor,
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Consumer<ContentProvider>(builder: (ctx, data, ch) {
          List<TimelineModel> items = [];
          data.MainContents.forEach((element) {
            TimelineModel item = TimelineModel(
              Column(children: [
                Text(element,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Nunito',
                    )),
                SizedBox(
                  height: 20,
                ),
              ]),
              iconBackground: Colors.white,
              icon: Icon(Icons.circle, color: Colors.blue),
            );
            items.add(item);
          });
          TimelineModel item = TimelineModel(
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              onReady: () {
                _isPlayerReady = true;
              },
            ),
            iconBackground: Colors.white,
            icon: Icon(Icons.circle, color: Colors.blue),
          );
          items.add(item);
          item = TimelineModel(
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: () {
                    _controller.pause();
                    Navigator.of(context).pushNamed('/quiz-screen',
                        arguments: {'idContent': _id, 'idCate': _idCate});
                  },
                  child: Text(
                    'Làm bài kiểm tra',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                    ),
                  )),
            ]),
            iconBackground: Colors.white,
            icon: Icon(Icons.circle, color: Colors.blue),
          );
          items.add(item);
          return Column(children: [
            Expanded(
                child:
                    Timeline(children: items, position: TimelinePosition.Left)),
          ]);
        }),
      ),
    );
  }
}
