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

  @override
  void didChangeDependencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _user_name = prefs.getString('user_name');
    });
    if (prefs.containsKey('is_loaded'))
      setState(() {
        has_lecture = true;
      });
    else {
      setState(() {
        has_lecture = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
            Text("Chào $_user_name,", style: kHeadingextStyle),
            Text("Hãy bắt đầu tìm hiểu lịch sử nào!",
                style: kSubheadingextStyle),
            //SizedBox(height: 60),
            /* Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: kPrimaryGradient,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset("assets/images/bac_thuoc_lan_1.jpg"),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      FittedBox(
                        //fit: BoxFit.fill,
                        child: Text(
                          "Thời kỳ Bắc thuộc lần 1",
                          style: TextStyle(
                            fontSize: 12,
                            //color: Color(0xFFA0A5BD),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
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
            ), */
            /* Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                height: 60,
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
                        fontSize: 18,
                        color: Color(0xFFA0A5BD),
                      ),
                    )
                  ],
                ),
              ), */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Chuyên mục", style: kTitleTextStyle),
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
                        child: StaggeredGridView.countBuilder(
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
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                height: index.isEven ? 200 : 240,
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
                                    Text(
                                      data.Categories[index].title,
                                      style: kTitleTextStyle,
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
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      if (has_lecture) CurrentLecture()
    ]);
  }
}

class CurrentLecture extends StatelessWidget {
  const CurrentLecture({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //child: Card(
      child: GestureDetector(
        onTap: () {
          print('tap');
        },
        child: Container(
          //margin: EdgeInsets.symmetric(vertical: 30),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: kPrimaryGradient,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset("assets/images/bac_thuoc_lan_1.jpg"),
              SizedBox(width: 16),
              Column(
                children: [
                  FittedBox(
                    //fit: BoxFit.fill,
                    child: Text(
                      "Thời kỳ Bắc thuộc lần 1",
                      style: TextStyle(
                        fontSize: 12,
                        //color: Color(0xFFA0A5BD),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
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
