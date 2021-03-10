import 'package:hisapp/providers/character_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import './constants.dart';
import './screens/home/home_screen.dart';
import './screens/events/events_screen.dart';
import 'package:hisapp/providers/HisEventProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CharacterProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => HisEventProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Travels App',
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            textTheme:
                GoogleFonts.poppinsTextTheme().apply(displayColor: Colors.red),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
          routes: {
            '/event-screen': (ctx) => EventsScreen(),
          }),
    );
  }
}
