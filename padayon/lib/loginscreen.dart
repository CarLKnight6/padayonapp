import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    bool _secureText = true;
    final logemailcontroller = TextEditingController();
    final logpasswordcontroller = TextEditingController();
    // ignore: unused_local_variable
    bool emailaddValidate = false;

    void clearText() {
      logemailcontroller.clear();
      logpasswordcontroller.clear();
    }

    Future<void> _loginUser() async {
      // try {
      //   UserCredential firebaseUser =
      //       (await FirebaseAuth.instance.signInWithEmailAndPassword(
      //     email: logemailcontroller.text,
      //     password: logpasswordcontroller.text,
      //   ))
      //           .user;
      //   if (firebaseUser != null) {
      //     // SharedPreferences prefs = await SharedPreferences.getInstance();
      //     // prefs.setString('displayName', user.displayName);

      //     print("hello");
      //     Navigator.pushNamed(context, '/adminscreen');
      //   }
      // } catch (e) {
      //   print(e);
      // }
      try {
        // ignore: unused_local_variable
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: logemailcontroller.text,
                password: logpasswordcontroller.text);
        Navigator.pushNamed(context, '/homescreen');
        clearText();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }

    // String? validateEmail(String? formEmail) {
    //   if (formEmail == null || formEmail.isEmpty)
    //     return 'E-mail address is required.';

    //   return null;
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('padayon'),
        backgroundColor: Color.fromRGBO(8, 120, 93, 3),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Container(
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
                    style: TextStyle(color: Colors.white),
                    controller: logemailcontroller,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'e-mail address is required.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your email',
                      prefixIcon: Icon(Icons.person),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      //when error has occured
                      errorStyle: TextStyle(
                        color: Colors.red,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: logpasswordcontroller,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'password is required.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_secureText
                            ? Icons.remove_red_eye
                            // ignore: dead_code
                            : Icons.security),
                        onPressed: () {
                          setState(() {
                            _secureText = !_secureText;
                          });
                        },
                      ),
                      labelText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                    ),
                    obscureText: _secureText,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _loginUser();
                    } else {
                      print('wrong email or password!');
                    }

                    //login function button
                  },
                  color: Color.fromRGBO(59, 239, 109, 23),
                  textColor: Colors.white,
                  child: Text(
                    "login",
                    // style: GoogleFonts.droidSans(
                    //     fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registrationscreen');
                    //   if(acontroller.text == ''){

                    // }else{
                    //     searchedterm = acontroller.text ;
                    //   Navigator.pushNamed(context, '/SearchScreen');
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => SearchResultScreen(searchedterm: searchedterm),
                    //     ));
                    //   print("searched book: $searchedterm");
                    // }
                  },
                  color: Color.fromRGBO(59, 239, 109, 23),
                  textColor: Colors.white,
                  child: Text(
                    "register",
                    // style: GoogleFonts.droidSans(
                    //     fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
