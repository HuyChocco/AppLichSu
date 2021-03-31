import 'package:hisapp/providers/CategoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:hisapp/providers/QuestionProvider.dart';
import 'package:hisapp/screens/contents/main_content_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/home/home_screen.dart';
import './screens/events/events_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screens/quiz/quiz_screen.dart';
import 'screens/details/details_screen.dart';
import 'package:hisapp/providers/ContentProvider.dart';
import 'package:hisapp/screens/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLogged = false;

  Future<void> tryAutoLogin() async {
    print('hi');
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('user_name')) {
      _isLogged = false;
    } else
      _isLogged = true;
    print(_isLogged);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ContentProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => QuestionProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Em yêu lịch sử',
          theme: ThemeData(
              /* brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            textTheme:
                GoogleFonts.poppinsTextTheme().apply(displayColor: Colors.red),
            visualDensity: VisualDensity.adaptivePlatformDensity, */
              ),
          home: FutureBuilder(
              future: tryAutoLogin(),
              builder: (ctx, snapshot) =>
                  (_isLogged ? HomeScreen() : WelcomeScreen())),
          //     Scaffold(
          //   appBar: AppBar(title: Text("Model Viewer")),
          //   body: ModelViewer(
          //     src: 'assets/3d_images/trongdong.glb',
          //     alt: "A 3D model of an astronaut",
          //     ar: true,
          //     autoRotate: true,
          //     cameraControls: true,
          //   ),
          // ),
          routes: {
            '/home-screen': (ctx) => HomeScreen(),
            '/quiz-screen': (ctx) => QuizScreen(),
            '/details-screen': (ctx) => DetailsScreen(),
            '/main-content-screen': (ctx) => MainContentScreen(),
          }),
    );
  }
}
