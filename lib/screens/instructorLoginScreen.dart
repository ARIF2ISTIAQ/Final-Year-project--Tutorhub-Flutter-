import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/model/tutorservice.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flutter/services.dart';

import 'instructorRegistrationScreen.dart';
import 'instructor_dashboard.dart';

class InstructorLoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InstructorLoginScreenState();
  }
}

class InstructorLoginScreenState extends State<InstructorLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  String response_err = "";
  List<Tutor> response_success = [];

  Future<void> LoginTutor() async {
    firebaseTutorService tutorService = firebaseTutorService();
    Tutor tutor = await tutorService.getTutorByEmail(emailController.text);

    if (tutor.password == pwdController.text) {
      setState(() {
        response_success.clear();

        response_success.add(tutor);
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => instructor_dashboard(response_success),
          ));

      print(response_success[0].email);
    } else {
      setState(() {
        response_err = "Invalid email or password";
      });
      Toast.show("Invalid email or password", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }

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
                height: 60.0,
              ),
              Image(
                image: AssetImage("images/logo.png"),
                width: 350.0,
                height: 200.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 60.0,
              ),
              Text(
                "Login as an Student",
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
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Brand Bold",
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),

                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: pwdController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Brand Bold",
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),

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
                              "Login",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(23.0),
                        ),
                        onPressed: () => {
                              if ((emailController.text == "") ||
                                  (pwdController.text == ""))
                                {
                                  Toast.show(
                                      "Please complete the form", context,
                                      duration: 3, textColor: Colors.redAccent),
                                }
                              else
                                {
                                  LoginTutor(),
                                }
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
                        builder: (context) => InstructorRegistrationScreen()),
                  );
                },
                child: Text(
                  "Do not have an Account? Register Here.",
                  style: TextStyle(fontSize: 16.0, fontFamily: "Brand Bold"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
