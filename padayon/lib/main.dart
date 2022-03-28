import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:padayon/adminjournalusersearch/homepage.dart';
import 'loginscreen.dart';
import 'adminscreen.dart';
import 'registrationscreen.dart';
//import 'videocallscreen.dart';
import 'package:padayon/notelist.dart';
import 'package:padayon/usernotelist.dart';
import 'homescreen.dart';
import 'meditationscreen.dart';
import 'package:padayon/journalscreens/homepage.dart';
import 'package:padayon/videocallscreens/pages/home_page.dart';
import 'package:padayon/mentalhealthinfo.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:padayon/settaskscreens/epap.dart';
import 'package:padayon/startyourjourneyscreens/onboarding_page.dart';
import 'package:padayon/adminscreen.dart';
import 'adminjournalscreens/homepage.dart';
import 'adminjournalusersearch/homepage.dart';
import 'package:padayon/moodmanager.dart';
import 'package:padayon/mentalhealthinfo2.dart';
import 'package:padayon/taskfilter.dart';
import 'package:padayon/usermanager.dart';
import 'package:padayon/moodsgraph.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  tz.initializeTimeZones();

  ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
        body: Center(
          child: Text("Not found!"),
        ),
      );
// void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'padayon';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      theme: ThemeData(errorColor: Colors.white),
      title: title,
      initialRoute: '/',
      routes: {
        '/': (context) => OnBoardingPage(),
        '/loginscreen': (context) => loginscreen(),
        '/adminscreen': (context) => adminscreen(),
        '/registrationscreen': (context) => registrationscreen(),
        //'/videocallscreen': (context) => videocallscreen(),
        '/homescreen': (context) => homescreen(),
        '/meditationscreen': (context) => meditationscreen(),
        '/journalscreens': (context) => HomePage(),
        '/videocallscreens': (context) => MyHomePage(),
        '/mentalhealthinfoscreen': (context) => mentalhealthinfoscreen(),
        '/mentalhealthinfo2': (context) => mentalhealthinfo2(),
        '/settaskscreens': (context) => Epap(),
        '/adminscreens': (context) => adminscreen(),
        '/adminjournalscreens': (context) => HomePage2(),
        '/adminjournalusersearch': (context) => HomePageSearch(),
        '/noteslists': (context) => NoteList(),
        '/moodmanager': (context) => moodmanager(),
        '/usermanager': (context) => usermanager(),
        '/usernoteslists': (context) => UserNoteList(),
        '/taskfilter': (context) => TaskFilter(),
        '/moodsgraph': (context) => moodsgraph(),

        //'/journalscreen': (context) => journalscreen(),
        //  '/journalnotescreen': (context) => journalnotescreen(),
      },
    );
  }
}//copyrights: @CarLKnight6