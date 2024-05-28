import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/model/tutorservice.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:easy_tutor/screens/expertiseArea.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'instructorLoginScreen.dart';
import 'package:toast/toast.dart';
import 'package:flutter/services.dart';

import 'instructorLoginScreen.dart';
import 'learnerLoginScreen.dart';

class InstructorRegistrationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InstructorRegistrationScreenState();
  }
}

class InstructorRegistrationScreenState extends State<InstructorRegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController conf_pwdController = TextEditingController();
  TextEditingController FNameController = TextEditingController();
  TextEditingController LNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String response_err = "";
  String response_success = "";

  registerTutor() async {
    firebaseTutorService collection = firebaseTutorService();
    Tutor tutor = Tutor(
      firstName: FNameController.text,
      lastName: LNameController.text,
      email: emailController.text,
      password: pwdController.text,
      phoneNo: phoneController.text,
    );
    await collection.addTutor(tutor);
    // to login after registration
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InstructorLoginScreen(),
      ),
    );
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
                "Register as a Student",
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
                    TextFormField(
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
                        FilteringTextInputFormatter.allow(RegExp('[a-z,A-Z]+')),
                      ],
                    ),

                    SizedBox(
                      height: 0.50,
                    ),
                    TextFormField(
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
                    TextFormField(
                      controller: phoneController,
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
                      height: 1.0,
                    ),
                    TextField(
                      controller: conf_pwdController,
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
                                  (pwdController.text == "") ||
                                  (phoneController.text == ""))
                                {
                                  //Toast notific
                                  Toast.show(
                                      "Please complete the form", context,
                                      duration: 3, textColor: Colors.redAccent),
                                }
                              else if (pwdController.text !=
                                  conf_pwdController.text)
                                {
                                  //Toast notific
                                  Toast.show("Passwords do not match", context,
                                      duration: 3, textColor: Colors.redAccent),
                                }
                              else if (pwdController.text.length < 8)
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
                              else if (phoneController.text.length < 11 ||
                                  phoneController.text.length > 11)
                                {
                                  Toast.show("Invalid phone number", context,
                                      duration: 3, textColor: Colors.redAccent),
                                }
                              else if ((phoneController.text.contains("0", 0) &&
                                      phoneController.text.contains("1", 1) &&
                                      phoneController.text.contains("1", 2)) ==
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
                                  registerTutor(),
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
                        builder: (context) => InstructorLoginScreen()),
                  );
                },
                child: Text(
                  "Already have an Account? Login Here.",
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
