import 'package:hisapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hisapp/providers/ContentProvider.dart';

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
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Nội dung", style: kTitleTextStyle),
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
                                    // print(data.Contents[0].imagePath);
                                    return Expanded(
                                      child: ListView.builder(
                                        itemBuilder: (ctx, index) => Material(
                                          color: Colors.white,
                                          child: InkWell(
                                            splashColor: Colors.green,
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  '/main-content-screen',
                                                  arguments: {
                                                    'id':
                                                        data.Contents[index].id,
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
                                                        .Contents[index].idCate,
                                                    'title': data
                                                        .Contents[index].title,
                                                  });
                                            },
                                            child: CourseContent(
                                              number: (index + 1).toString(),
                                              duration: 5.35,
                                              title: data.Contents[index].title,
                                              isDone:
                                                  data.Contents[index].isDone ==
                                                          1
                                                      ? true
                                                      : false,
                                            ),
                                          ),
                                        ),
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
          Container(
            constraints: BoxConstraints(maxWidth: 150),
            child: RichText(
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
                    style: kSubtitleTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
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
