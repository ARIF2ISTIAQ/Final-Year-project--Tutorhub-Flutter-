//import 'package:easy_tutor/screens/tutorLoginScreen.dart';
import 'dart:math';

import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/model/tutorservice.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:easy_tutor/screens/mainscreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import '../../model/gurdianservice.dart';
import 'learnerLoginScreen.dart';

class LearnerRegistrationScreen extends StatefulWidget {
  @override
  // ignore: override_on_non_overriding_member
  State<StatefulWidget> createState() {
    return LearnerRegistrationScreenState();
  }
}

class LearnerRegistrationScreenState
    extends State<LearnerRegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController conf_passController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController FNameController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController LNameController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  // ignore: non_constant_identifier_names
  String response_err = "";
  // ignore: non_constant_identifier_names
  String response_success = "";

  registerGuardian() async {
 
    gurdiianService gurdianService = gurdiianService();

    Student gurdian = Student(
        Random.secure().nextInt(1000000),
        FNameController.text,
        LNameController.text,
        emailController.text,
        passController.text,
        phoneNumController.text);
    await gurdianService.addGurdian(gurdian);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Image(
                image: AssetImage("images/logo.png"),
                width: 350.0,
                height: 200.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Register as a Tutor",
                style: TextStyle(
                  fontSize: 23.0,
                  fontFamily: "Brand Bold",
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.50,
                    ),
                    TextField(
                      controller: FNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "First Name",
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
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('[a-z.,A-Z]+')),
                      ],
                    ),
                    SizedBox(
                      height: 0.50,
                    ),
                    TextField(
                      controller: LNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Last Name",
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
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-z,A-Z]+')),
                      ],
                    ),

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
                      controller: phoneNumController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone",
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
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                      ],
                    ),

                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: passController,
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
                      height: 1.0,
                    ),
                    TextField(
                      controller: conf_passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
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
                              "Create Account",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(23.0),
                        ),
                        onPressed: () => {
                              if ((FNameController.text == "") ||
                                  (LNameController.text == "") ||
                                  (emailController.text == "") ||
                                  (passController.text == "") ||
                                  (phoneNumController.text == ""))
                                {
                                  //Toast notific
                                  Toast.show(
                                      "Please complete the form", context,
                                      duration: 3, textColor: Colors.redAccent),
                                }
                              else if (passController.text !=
                                  conf_passController.text)
                                {
                                  //Toast notific
                                  Toast.show("Passwords do not match", context,
                                      duration: 3, textColor: Colors.redAccent),
                                }
                              else if (passController.text.length < 8)
                                {
                                  //Toast notific
                                  Toast.show(
                                      "Password length should be at least 8 characters or more",
                                      context,
                                      duration: 3,
                                      textColor: Colors.redAccent),
                                }
                              else if (!(EmailValidator.validate(
                                  emailController.text)))
                                {
                                  Toast.show("Email address invalid", context,
                                      duration: 3, textColor: Colors.redAccent),
                                }
                              else if (phoneNumController.text.length < 11 ||
                                  phoneNumController.text.length > 11)
                                {
                                  Toast.show("Invalid phone number", context,
                                      duration: 3, textColor: Colors.redAccent),
                                }
                              else if ((phoneNumController.text
                                          .contains("0", 0) &&
                                      phoneNumController.text
                                          .contains("1", 1) &&
                                      phoneNumController.text
                                          .contains("1", 2)) ==
                                  false)
                                {
                                  Toast.show(
                                      "Invalid phone number\nValid format: 01123455432 ",
                                      context,
                                      duration: 3,
                                      textColor: Colors.redAccent),
                                }
                              else
                                {
                                  registerGuardian(),
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
                        builder: (context) => MainScreen()),
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
