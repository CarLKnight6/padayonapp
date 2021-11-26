import 'package:flutter/material.dart';

class adminscreen extends StatelessWidget {
  // final _db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('padayon'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
          //stack for fitting the favorite caption and icon and also search button at the bottom while showing a streambuilder
          fit: StackFit.expand,
          children: [
            Container(
              height: 200,
            )
          ]), //stack
    );
  }
}
