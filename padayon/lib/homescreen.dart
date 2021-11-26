import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> _signOut() async {
    await _firebaseAuth.signOut();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('padayon'),
          backgroundColor: Color.fromRGBO(8, 120, 93, 3),
          automaticallyImplyLeading: false,
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
                MaterialButton(
                  onPressed: () {
                    _signOut();
                    Navigator.pushNamed(context, '/');
                  },
                  color: Color.fromRGBO(59, 239, 109, 23),
                  textColor: Colors.white,
                  child: Text(
                    "SIGNOUT",
                    // style: GoogleFonts.droidSans(
                    //     fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    readOnly: true,
                    style: TextStyle(color: Colors.white),
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(
                      labelText: 'WELCOME USER',
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
                MaterialButton(
                  onPressed: () {
                    //START YOUR JOURNEY FUNCTION
                  },
                  color: Color.fromRGBO(59, 239, 109, 23),
                  textColor: Colors.white,
                  child: Text(
                    "START YOUR JOURNEY",
                    // style: GoogleFonts.droidSans(
                    //     fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/meditationscreen');
                  },
                  color: Color.fromRGBO(59, 239, 109, 23),
                  textColor: Colors.white,
                  child: Text(
                    "MEDITATION",
                    // style: GoogleFonts.droidSans(
                    //     fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    //VIDEOCHATSCREEN FUNCTION
                    Navigator.pushNamed(context, '/videocallscreens');
                  },
                  color: Color.fromRGBO(59, 239, 109, 23),
                  textColor: Colors.white,
                  child: Text(
                    "ONE ON ONE VIDEO CHAT SESSION",
                    // style: GoogleFonts.droidSans(
                    //     fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/journalscreens');
                    //JOURNAL FUNCTION
                  },
                  color: Color.fromRGBO(59, 239, 109, 23),
                  textColor: Colors.white,
                  child: Text(
                    "JOURNAL",
                    // style: GoogleFonts.droidSans(
                    //     fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/mentalhealthinfoscreen');
                    //mental FUNCTION
                  },
                  color: Color.fromRGBO(59, 239, 109, 23),
                  textColor: Colors.white,
                  child: Text(
                    "MENTAL HEALTH INFO",
                    // style: GoogleFonts.droidSans(
                    //     fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/settaskscreens');
                    //task function
                  },
                  color: Color.fromRGBO(59, 239, 109, 23),
                  textColor: Colors.white,
                  child: Text(
                    "SET TASKS SCHEDULER",
                    // style: GoogleFonts.droidSans(
                    //     fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )));
  }
}
