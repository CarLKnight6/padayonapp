import 'package:flutter/material.dart';
import 'package:padayon/settaskscreens/datepicker.dart';

class Epap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.purple[900],
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.purple[900]),
        ),
        home: Scaffold(
          body: Center(
            child: DatePicker(),
          ),
        ));
  }
}
