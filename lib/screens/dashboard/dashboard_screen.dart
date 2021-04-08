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
  @override
  void didChangeDependencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _user_name = prefs.getString('user_name');
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Text("Hãy bắt đầu tìm hiểu lịch sử nào!", style: kSubheadingextStyle),
          SizedBox(height: 60),
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
            future:
                Provider.of<CategoryProvider>(context, listen: false).getData(),
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
                              Navigator.of(context).pushNamed('/details-screen',
                                  arguments: {
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
    );
  }
}
