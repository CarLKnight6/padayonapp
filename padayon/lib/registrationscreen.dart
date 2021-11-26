import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';

class registrationscreen extends StatefulWidget {
  const registrationscreen({Key? key}) : super(key: key);

  @override
  _registrationscreenState createState() => _registrationscreenState();
}

class _registrationscreenState extends State<registrationscreen> {
  final regemailcontroller = TextEditingController();
  final regpasswordcontroller = TextEditingController();
  var anoncontroller = TextEditingController();
  bool _randomtext = true;
  var donetext = 'done';
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  void clearText() {
    regemailcontroller.clear();
    regpasswordcontroller.clear();
    anoncontroller.clear();
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<void> _createUser() async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: regemailcontroller.text,
              password: regpasswordcontroller.text);
      setState(() {
        donetext = 'success!';
      });
      clearText();
      Navigator.pushNamed(context, '/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('padayon'),
          backgroundColor: Color.fromRGBO(8, 120, 93, 3),
          automaticallyImplyLeading: false,
        ),
        body: Container(
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
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    readOnly: true,
                    style: TextStyle(color: Colors.white),
                    controller: anoncontroller,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'press the box to get anon name';
                      }
                      return null;
                    },
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_randomtext
                            ? Icons.account_box
                            : Icons.add_box_outlined),
                        onPressed: () {
                          anoncontroller.clear();
                          setState(() {
                            anoncontroller.clear();
                            anoncontroller.text =
                                getRandomString(10); // randomfunction here
                          });
                        },
                      ),
                      labelText: 'your anonymous name',
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: regpasswordcontroller,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'password is required!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your password',
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: regemailcontroller,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'e-mail address is required.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your email address',

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
                    _createUser();
                  },
                  color: Color.fromRGBO(59, 239, 109, 23),
                  textColor: Colors.white,
                  child: Text(
                    donetext,
                    // style: GoogleFonts.droidSans(
                    //     fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )));
  }
}
