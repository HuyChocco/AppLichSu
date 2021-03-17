import 'package:hisapp/providers/character_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:google_fonts/google_fonts.dart';
import './screens/home/home_screen.dart';
import './screens/events/events_screen.dart';
import 'package:hisapp/providers/HisEventProvider.dart';
import 'screens/quiz/quiz_screen.dart';
import 'screens/details/details_screen.dart';
import 'package:hisapp/providers/ContentProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /* final List<Map<String, Object>> _pages = [
    {'page': HomeScreen(), 'title': 'Màn hình chính'},
    {'page': QuizScreen(), 'title': 'Câu hỏi'},
  ]; */
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CharacterProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ContentProvider(),
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
          home: HomeScreen(),
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
            '/event-screen': (ctx) => EventsScreen(),
            '/quiz-screen': (ctx) => QuizScreen(),
            '/details-screen': (ctx) => DetailsScreen(),
          }),
    );
  }
}
