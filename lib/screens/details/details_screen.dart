import 'package:hisapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hisapp/providers/ContentProvider.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

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
          image: DecorationImage(
            image: AssetImage("assets/images/ux_big.png"),
            alignment: Alignment.topRight,
          ),
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
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 60),
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
                                  List<TimelineModel> items = [];
                                  data.Contents.forEach((element) {
                                    TimelineModel item = TimelineModel(
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                '/main-content-screen',
                                                arguments: {
                                                  'id': element.id,
                                                  'imagePath':
                                                      element.imagePath,
                                                  'videoPath':
                                                      element.videoPath,
                                                  'filePath': element.filePath,
                                                  'idCate': element.idCate,
                                                  'title': element.title,
                                                });
                                          },
                                          child: CourseContent(
                                            title: element.title,
                                            imagePath: element.imagePath,
                                            time: element.time,
                                          ),
                                        ),
                                        //position: TimelineItemPosition.random,
                                        iconBackground: Colors.white,
                                        icon: Icon(Icons.circle,
                                            color: Colors.green.withOpacity(
                                                element.isDone == 1 ? 1 : .2)));
                                    items.add(item);
                                  });

                                  return Expanded(
                                      child: Timeline(
                                          children: items,
                                          position: TimelinePosition.Left));
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          if (imagePath.length > 0)
            Container(
              alignment: Alignment.center,
              child:
                  Image(image: AssetImage(imagePath), width: 160, height: 160),
            )
          else
            Container(),
          if (time != '')
            Text(
              time,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(maxWidth: 150),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: kSubtitleTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
