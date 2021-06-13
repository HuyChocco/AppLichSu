import 'package:hisapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hisapp/providers/ContentProvider.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var _isInit = true;
  String cateId;
  String title;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      if (ModalRoute.of(context).settings.arguments == null) return;
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      cateId = args['categoryId'];
      title = args['title'];
      print('categoryId: $cateId');
      print('title: $title');
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    int isDone = 0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        //title: Text(content.Title),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
          // image: DecorationImage(
          //   image: AssetImage("assets/images/ux_big.png"),
          //   alignment: Alignment.topRight,
          // ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30),
                  Text(title, style: kHeadingextStyle),
                  //SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FutureBuilder(
                          future: Provider.of<ContentProvider>(context,
                                  listen: false)
                              .setContentByCateId(cateId),
                          builder: (ctx, data) => data.connectionState ==
                                  ConnectionState.waiting
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Consumer<ContentProvider>(
                                  builder: (ctx, data, ch) {
                                  return Expanded(
                                    child: ListView.builder(
                                      itemBuilder: (ctx, index) {
                                        if (index % 2 == 0)
                                          return SizedBox(
                                            width: 100,
                                            height: 200,
                                            child: TimelineTile(
                                              isFirst:
                                                  index == 0 ? true : false,
                                              alignment: TimelineAlign.center,
                                              indicatorStyle: IndicatorStyle(
                                                width: 20,
                                                color: data.Contents[index]
                                                            .isDone >
                                                        0
                                                    ? Colors.lightGreen
                                                    : Colors.green[100],
                                                padding: EdgeInsets.all(8),
                                                indicatorY: 0.1,
                                              ),
                                              leftChild: InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          '/main-content-screen',
                                                          arguments: {
                                                        'id': data
                                                            .Contents[index].id,
                                                        'imagePath': data
                                                            .Contents[index]
                                                            .imagePath,
                                                        'videoPath': data
                                                            .Contents[index]
                                                            .videoPath,
                                                        'filePath': data
                                                            .Contents[index]
                                                            .filePath,
                                                        'idCate': data
                                                            .Contents[index]
                                                            .idCate,
                                                        'title': data
                                                            .Contents[index]
                                                            .title,
                                                      });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    CourseContent(
                                                      title: data
                                                          .Contents[index]
                                                          .title,
                                                      imagePath: data
                                                          .Contents[index]
                                                          .imagePath,
                                                      time: data
                                                          .Contents[index].time,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        else
                                          return SizedBox(
                                            width: 100,
                                            height: 150,
                                            child: TimelineTile(
                                              alignment: TimelineAlign.center,
                                              indicatorStyle: IndicatorStyle(
                                                width: 20,
                                                color: data.Contents[index]
                                                            .isDone >
                                                        0
                                                    ? Colors.lightGreen
                                                    : Colors.green[100],
                                                padding: EdgeInsets.all(8),
                                                indicatorY: 0.1,
                                              ),
                                              rightChild: InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          '/main-content-screen',
                                                          arguments: {
                                                        'id': data
                                                            .Contents[index].id,
                                                        'imagePath': data
                                                            .Contents[index]
                                                            .imagePath,
                                                        'videoPath': data
                                                            .Contents[index]
                                                            .videoPath,
                                                        'filePath': data
                                                            .Contents[index]
                                                            .filePath,
                                                        'idCate': data
                                                            .Contents[index]
                                                            .idCate,
                                                        'title': data
                                                            .Contents[index]
                                                            .title,
                                                      });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    CourseContent(
                                                      title: data
                                                          .Contents[index]
                                                          .title,
                                                      imagePath: data
                                                          .Contents[index]
                                                          .imagePath,
                                                      time: data
                                                          .Contents[index].time,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                      },
                                      itemCount: data.Contents.length,
                                    ),
                                  );
                                }),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                    Positioned(
                        right: 0,
                        left: 0,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 50,
                                color: kTextColor.withOpacity(.1),
                              ),
                            ],
                          ),
                          child: Container(
                            // alignment: Alignment.center,
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: kBlueColor,
                            ),
                            child: Consumer<ContentProvider>(
                              builder: (ctx, data, ch) => Stack(children: [
                                LayoutBuilder(
                                  builder: (context, constraints) => Container(
                                    width: constraints.maxWidth * data.rate,
                                    decoration: BoxDecoration(
                                      gradient: kPrimaryGradient,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Quá trình ${(data.rate * 100).round()}%",
                                    style: kSubtitleTextStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        )
                        //],
                        //),
                        //  ),
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String title;
  final String imagePath;
  final String time;

  const CourseContent({
    Key key,
    this.title,
    this.imagePath,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'Nunito',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 150),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: kSubtitleTextStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                height: 1.5,
                fontFamily: 'Nunito',
              ),
            ),
          ),
          if (imagePath.length > 0)
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(imagePath))),
            )
          else
            Container(),
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
