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
  @override
  void didChangeDependencies() async {
    if (!_isInit) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        if (prefs.containsKey('user_name')) {
          _user_name = prefs.getString('user_name');
        }
      });
      if (prefs.containsKey('is_loaded')) {
        if (prefs.containsKey('id')) {
          setState(() {
            _id = prefs.getString('id');
          });
        }
        if (prefs.containsKey('title')) {
          setState(() {
            _title = prefs.getString('title');
          });
        }
        if (prefs.containsKey('id_cate')) {
          setState(() {
            _id_cate = prefs.getString('id_cate');
          });
        }
        if (prefs.containsKey('image_path')) {
          setState(() {
            _image_path = prefs.getString('image_path');
          });
        }
        if (prefs.containsKey('video_path')) {
          setState(() {
            _video_path = prefs.getString('video_path');
          });
        }
        if (prefs.containsKey('file_path')) {
          setState(() {
            _file_path = prefs.getString('file_path');
          });
        }
        setState(() {
          has_lecture = true;
        });
      } else {
        setState(() {
          has_lecture = false;
        });
      }
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "Hãy bắt đầu tìm hiểu lịch sử nào!",
              style: TextStyle(fontSize: 12),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/search-screen');
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/icons/search.svg"),
                    SizedBox(width: 16),
                    Text(
                      "Tìm kiếm ở đây",
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFA0A5BD),
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
                  ),
                ),
                // Text(
                //   "See All",
                //   style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                // ),
              ],
            ),
            SizedBox(height: 30),
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
                                didChangeDependencies();
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: AssetImage(
                                      data.Categories[index].imagePath),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white.withOpacity(0.4)),
                                    padding: EdgeInsets.all(6),
                                    child: Text(
                                      data.Categories[index].title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        /* StaggeredGridView.countBuilder(
                          padding: EdgeInsets.all(0),
                          crossAxisCount: 2,
                          itemCount: data.Categories.length,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/details-screen', arguments: {
                                  'categoryId': data.Categories[index].id,
                                  'title': data.Categories[index].title
                                }).then((value) {
                                  didChangeDependencies();
                                  //setState(() {});
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                height: index.isEven ? 200 : 240,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  /* image: DecorationImage(
                                    image: AssetImage(
                                        data.Categories[index].imagePath),
                                    fit: BoxFit.fill,
                                  ), */
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.white.withOpacity(0.4)),
                                      padding: EdgeInsets.all(6),
                                      child: Text(
                                        data.Categories[index].title,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    /*  Text(
                                  '${categories[index].numOfCourses} Courses',
                                  style: TextStyle(
                                    color: kTextColor.withOpacity(.5),
                                  ),
                                ) */
                                  ],
                                ),
                              ),
                            );
                          },
                          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                        ), */
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
            filePath: _file_path)
    ]);
  }
}

class CurrentLecture extends StatelessWidget {
  String imagePath;
  String videoPath;
  String filePath;
  String id;
  String idCate;
  String title;
  CurrentLecture({
    this.title,
    this.id,
    this.idCate,
    this.imagePath,
    this.videoPath,
    this.filePath,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //child: Card(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/main-content-screen', arguments: {
            'id': id,
            'imagePath': imagePath,
            'videoPath': videoPath,
            'filePath': filePath,
            'idCate': idCate,
            'title': title,
          });
        },
        child: Container(
          //margin: EdgeInsets.symmetric(vertical: 30),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            //gradient: kPrimaryGradient,
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(imagePath),
              SizedBox(width: 16),
              Column(
                children: [
                  FittedBox(
                    //fit: BoxFit.fill,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 10,
                        //color: Color(0xFFA0A5BD),
                      ),
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
                        fontSize: 10,
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
      ),
      bottom: 0,
      left: 0,
      right: 0,
    );
  }
}
