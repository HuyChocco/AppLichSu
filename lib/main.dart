import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hisapp/providers/AnniversaryProvider.dart';
import 'package:hisapp/providers/CategoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:hisapp/providers/QuestionProvider.dart';
import 'package:hisapp/screens/calendar/calendar_screen.dart';
import 'package:hisapp/screens/contents/main_content_screen.dart';
import 'package:hisapp/screens/discussion/post_detail.dart';
import 'package:hisapp/screens/search/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/home/home_screen.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screens/quiz/quiz_screen.dart';
import 'screens/details/details_screen.dart';
import 'package:hisapp/providers/ContentProvider.dart';
import 'package:hisapp/screens/welcome/welcome_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
      AndroidInitializationSettings('codex_logo');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  });
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
        ChangeNotifierProvider(
          create: (ctx) => AnniversaryProvider(),
        ),
      ],
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Em yêu lịch sử',
          theme: ThemeData(
              //scaffoldBackgroundColor: Color(0xFFc8c9cb),
              /* brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            textTheme:
                GoogleFonts.poppinsTextTheme().apply(displayColor: Colors.red),
            visualDensity: VisualDensity.adaptivePlatformDensity, */
              ),
          home: FutureBuilder(
            future: tryAutoLogin(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return CircularProgressIndicator();
              else {
                return _isLogged ? HomeScreen() : WelcomeScreen();
              }
            },
          ),
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
            '/welcome-screen': (ctx) => WelcomeScreen(),
            '/home-screen': (ctx) => HomeScreen(),
            '/quiz-screen': (ctx) => QuizScreen(),
            '/details-screen': (ctx) => DetailsScreen(),
            '/main-content-screen': (ctx) => MainContentScreen(),
            '/post-detail': (ctx) => PostDetail(),
            '/search-screen': (ctx) => SearchScreen(),
            '/calendar-screen': (ctx) => CalendarScreen(),
          }),
    );
  }
}
