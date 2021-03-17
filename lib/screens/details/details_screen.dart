import 'package:hisapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hisapp/models/HisEvent.dart';
import 'package:provider/provider.dart';
import 'package:hisapp/providers/ContentProvider.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var _isInit = true;
  ContentProvider contentProvider;
  Categories cateId;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      if (ModalRoute.of(context).settings.arguments == null) return;
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, Categories>;
      cateId = args['categoryId'];
      contentProvider = Provider.of<ContentProvider>(context, listen: false);
      contentProvider.setContentByCateId(cateId);
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
                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/arrow-left.svg"),
                      SvgPicture.asset("assets/icons/more-vertical.svg"),
                    ],
                  ), */
                  SizedBox(height: 30),
                  /* ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: kBestSellerColor,
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        "BestSeller".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ), */
                  //SizedBox(height: 16),
                  Text(contentProvider.Title, style: kHeadingextStyle),
                  SizedBox(height: 16),
                  Row(
                      /* children: <Widget>[
                      SvgPicture.asset("assets/icons/person.svg"),
                      SizedBox(width: 5),
                      Text("18K"),
                      SizedBox(width: 20),
                      SvgPicture.asset("assets/icons/star.svg"),
                      SizedBox(width: 5),
                      Text("4.8")
                    ], */
                      ),
                  //SizedBox(height: 20),
                  /* RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "\$50 ",
                          style: kHeadingextStyle.copyWith(fontSize: 32),
                        ),
                        TextSpan(
                          text: "\$70",
                          style: TextStyle(
                            color: kTextColor.withOpacity(.5),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ), */
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
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Nội dung", style: kTitleTextStyle),
                          //SizedBox(height: 30),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (ctx, index) => Material(
                                color: Colors.white,
                                child: InkWell(
                                  splashColor: Colors.green,
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed('/event-screen', arguments: {
                                      'link':
                                          contentProvider.Contents[index].link,
                                    });
                                  },
                                  child: CourseContent(
                                    number: (index + 1).toString(),
                                    duration: 5.35,
                                    title:
                                        contentProvider.Contents[index].title,
                                    isDone:
                                        contentProvider.Contents[index].isDone,
                                  ),
                                ),
                              ),
                              itemCount: contentProvider.Contents.length,
                            ),
                          ),
                          /* CourseContent(
                              number: "01",
                              duration: 5.35,
                              title: "Thời kỳ tiền sử",
                              isDone: true,
                            ),
                            CourseContent(
                              number: '02',
                              duration: 19.04,
                              title: "Thời kỳ cổ đại",
                              isDone: true,
                            ),
                            CourseContent(
                              number: '03',
                              duration: 15.35,
                              title: "Thời kỳ Bắc thuộc",
                            ),
                            CourseContent(
                              number: '04',
                              duration: 5.35,
                              title: "Thời kỳ quân chủ",
                            ),
                            CourseContent(
                              number: '04',
                              duration: 5.35,
                              title: "Thời kỳ hiện đại",
                            ), */
                          SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
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
                        child: Row(
                          children: <Widget>[
                            /* Container(
                              padding: EdgeInsets.all(14),
                              height: 56,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFEDEE),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: SvgPicture.asset(
                                  "assets/icons/shopping-bag.svg"),
                            ), */
                            //SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: kBlueColor,
                                ),
                                child: Text(
                                  "Quá trình",
                                  style: kSubtitleTextSyule.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: kHeadingextStyle.copyWith(
              color: kTextColor.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 20),
          RichText(
            text: TextSpan(
              children: [
                /* TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                    color: kTextColor.withOpacity(.5),
                    fontSize: 18,
                  ),
                ), */
                TextSpan(
                  text: title,
                  style: kSubtitleTextSyule.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          // Expanded(
          //child:
          Container(
            //margin: EdgeInsets.only(left: 0),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreenColor.withOpacity(isDone ? 1 : .5),
            ),
            child: Icon(Icons.done, color: Colors.white),
          ),
          //)
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