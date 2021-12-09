// ignore: unused_import
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class adminscreen extends StatelessWidget {
  // final _db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/loginscreen');
                },
                icon: Icon(Icons.logout_rounded),
              ),
              title: Text('padayon'),
              backgroundColor: Color.fromRGBO(8, 120, 93, 3),
            ),
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        readOnly: true,
                        style: TextStyle(color: Colors.white),
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          labelText: 'WELCOME ADMIN',
                          prefixIcon: Icon(Icons.person),
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),

                          //when error has occured
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: MaterialButton(
                    //     onPressed: () {
                    //       Navigator.pushNamed(context, '/registrationscreen');
                    //       //REG FUNCTION
                    //     },
                    //     color: Colors.black.withOpacity(0.05),
                    //     textColor: Colors.white,
                    //     child: Text(
                    //       "REGISTER AN ACCOUNT",
                    //       // style: GoogleFonts.droidSans(
                    //       //     fontSize: 20.0, fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          //MANAGE ACCOUNT FUNCTION
                          _launchURL();
                        },
                        color: Colors.black.withOpacity(0.05),
                        textColor: Colors.white,
                        child: Text(
                          "MANAGE USER ACCOUNT",
                          // style: GoogleFonts.droidSans(
                          //     fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          //VIDEOCHATSCREEN FUNCTION
                          Navigator.pushNamed(context, '/videocallscreens');
                        },
                        color: Colors.black.withOpacity(0.05),
                        textColor: Colors.white,
                        child: Text(
                          "ONE ON ONE VIDEO CHAT SESSION",
                          // style: GoogleFonts.droidSans(
                          //     fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, '/journalscreens');
                          //JOURNAL FUNCTION
                          _launchURL2();
                        },
                        color: Colors.black.withOpacity(0.05),
                        textColor: Colors.white,
                        child: Text(
                          "VIEW ALL USER JOURNALS",
                          // style: GoogleFonts.droidSans(
                          //     fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, '/journalscreens');
                          //JOURNAL FUNCTION
                          Navigator.pushNamed(context, '/adminjournalscreens');
                        },
                        color: Colors.black.withOpacity(0.05),
                        textColor: Colors.white,
                        child: Text(
                          "FILTER MOOD OF JOURNALS",
                          // style: GoogleFonts.droidSans(
                          //     fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ))),
        onWillPop: () async {
          return false;
        });
  }
}

_launchURL() async {
  const url =
      'https://console.firebase.google.com/u/0/project/padayon-8b933/authentication/users';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url =
      'https://console.firebase.google.com/u/0/project/padayon-8b933/firestore/data/~2Fusers~2FnpyAZ2U8FjCSXmqxwGXq';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
