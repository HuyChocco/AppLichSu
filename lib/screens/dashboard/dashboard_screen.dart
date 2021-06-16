import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hisapp/providers/CategoryProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _user_name = "";
  bool has_lecture = false;
  String _id = "";
  String _id_cate = "";
  String _video_path = "";
  String _file_path = "";
  String _image_path = "";
  String _title = "";
  bool _isInit = false;

  Future<void> updateStateReading() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('is_loaded')) {
      if (prefs.containsKey('id')) {
        //setState(() {
        _id = prefs.getString('id');
        //});
      }
      if (prefs.containsKey('title')) {
        //setState(() {
        _title = prefs.getString('title');
        //});
      }
      if (prefs.containsKey('id_cate')) {
        //setState(() {
        _id_cate = prefs.getString('id_cate');
        // });
      }
      if (prefs.containsKey('image_path')) {
        //setState(() {
        _image_path = prefs.getString('image_path');
        // });
      }
      if (prefs.containsKey('video_path')) {
        //setState(() {
        _video_path = prefs.getString('video_path');
        // });
      }
      if (prefs.containsKey('file_path')) {
        // setState(() {
        _file_path = prefs.getString('file_path');
        //});
      }
      setState(() {
        has_lecture = true;
      });
    } else {
      setState(() {
        has_lecture = false;
      });
    }
  }

  @override
  void didChangeDependencies() async {
    if (!_isInit) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        if (prefs.containsKey('user_name')) {
          _user_name = prefs.getString('user_name');
        }
      });
      await updateStateReading();
      _isInit = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (mounted) {
      //didChangeDependencies();
    }
    return Stack(fit: StackFit.expand, children: [
      Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //SvgPicture.asset("assets/icons/menu.svg"),
                //Image.asset("assets/images/user.png"),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Chào $_user_name,",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Hãy bắt đầu tìm hiểu lịch sử nào!",
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Nunito',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/search-screen');
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F7),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/icons/search.svg"),
                    SizedBox(width: 16),
                    Text(
                      "Tìm kiếm ở đây",
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFA0A5BD),
                        fontFamily: 'Nunito',
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Chuyên mục",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
                // Text(
                //   "See All",
                //   style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                // ),
              ],
            ),
            // SizedBox(height: 10),
            FutureBuilder(
              future: Provider.of<CategoryProvider>(context, listen: false)
                  .getData(),
              builder: (ctx, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<CategoryProvider>(
                      builder: (ctx, data, ch) => Expanded(
                        child: GridView.builder(
                          itemCount: data.Categories.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/details-screen',
                                  arguments: {
                                    'categoryId': data.Categories[index].id,
                                    'title': data.Categories[index].title
                                  }).then((value) {
                                updateStateReading();
                              });
                            },
                            child: Stack(fit: StackFit.expand, children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.blue,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        data.Categories[index].imagePath),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                /* child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      /* decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: Colors.white.withOpacity(0.4)), */
                                      padding: EdgeInsets.all(6),
                                      child: Text(
                                        data.Categories[index].title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ),
                                    //SizedBox(height: 1),
                                    Container(
                                      /*  decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: Colors.white.withOpacity(0.4)), */
                                      //padding: EdgeInsets.all(2),
                                      child: Text(
                                        data.Categories[index].description,
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Colors.black,
                                          // fontWeight: FontWeight.bold,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ),
                                  ],
                                ), */
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      child: Text(
                                        data.Categories[index].title,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      child: Text(
                                        data.Categories[index].description,
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Colors.white,
                                          // fontWeight: FontWeight.bold,
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      if (has_lecture)
        CurrentLecture(
          title: _title,
          id: _id,
          idCate: _id_cate,
          imagePath: _image_path,
          videoPath: _video_path,
          filePath: _file_path,
          isVisble: true,
        )
    ]);
  }
}

class CurrentLecture extends StatefulWidget {
  String imagePath;
  String videoPath;
  String filePath;
  String id;
  String idCate;
  String title;
  bool isVisble;
  CurrentLecture({
    this.title,
    this.id,
    this.idCate,
    this.imagePath,
    this.videoPath,
    this.filePath,
    this.isVisble,
    Key key,
  }) : super(key: key);

  @override
  _CurrentLectureState createState() => _CurrentLectureState();
}

class _CurrentLectureState extends State<CurrentLecture> {
  @override
  Widget build(BuildContext context) {
    if (widget.isVisble == true)
      return Positioned(
        //child: Card(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/main-content-screen', arguments: {
              'id': widget.id,
              'imagePath': widget.imagePath,
              'videoPath': widget.videoPath,
              'filePath': widget.filePath,
              'idCate': widget.idCate,
              'title': widget.title,
            });
          },
          child: Stack(clipBehavior: Clip.none, children: [
            Container(
              //margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                //gradient: kPrimaryGradient,
                color: Colors.lightBlue[200],
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(widget.imagePath),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      //FittedBox(
                      //fit: BoxFit.fill,
                      //child:
                      Container(
                        constraints: BoxConstraints(maxWidth: 180),
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 6,
                            height: 1.5,
                            fontFamily: 'Nunito',
                            //color: Color(0xFFA0A5BD),
                          ),
                          //  ),
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "Nhấp để tiếp tục",
                          style: TextStyle(
                            fontSize: 6,
                            fontFamily: 'Nunito',
                            //color: Color(0xFFA0A5BD),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.play_arrow)
                ],
              ),
              // ),
            ),
            Positioned(
                right: 0,
                bottom: 35,
                child: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () async {
                    setState(() {
                      widget.isVisble = false;
                    });
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    if (prefs.containsKey('is_loaded'))
                      prefs.remove('is_loaded');
                  },
                ))
          ]),
        ),
        bottom: 0,
        left: 0,
        right: 0,
      );
    else
      return Container();
  }
}
