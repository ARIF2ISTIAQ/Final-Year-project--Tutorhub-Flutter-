import 'package:easy_tutor/screens/adminLogin.dart';
import 'package:easy_tutor/screens/learnerRegistrationScreen.dart';
import 'package:flutter/material.dart';
import 'package:easy_tutor/Screens/userLoginTypeScreen.dart';

import 'instructorRegistrationScreen.dart';

class MainScreen extends StatelessWidget {
  static const String idScreen = "mainScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Image(
                image: AssetImage("images/logo.png"),
                width: 350.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "We provide the best online Tutors!",
                style: TextStyle(
                  fontSize: 23.0,
                  fontFamily: "Brand Bold",
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0,
                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                        color: Colors.purple[200],
                        textColor: Colors.white,
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Student Registration",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(23.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    InstructorRegistrationScreen()),
                          );
                        }),

                    SizedBox(
                      height: 25.0,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                        color: Colors.purple[200],
                        textColor: Colors.white,
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Tutor Registration",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(23.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    LearnerRegistrationScreen()),
                          );
                        }),

                    SizedBox(
                      height: 25.0,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                        color: Colors.purple[200],
                        textColor: Colors.white,
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Admin Login",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(23.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    AdminLogin()),
                          );
                        }),

                  ],
                ),
              ),

              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        settings: RouteSettings(name: "ULogType"),
                        builder: (context) => UserLoginTypeScreen()),
                  );
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "Already have an account?  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontFamily: "Brand")),
                    TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                            color: Colors.blue[400],
                            fontSize: 18.0,
                            fontFamily: "Brand Bold")),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
