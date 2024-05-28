import 'package:easy_tutor/screens/screens/userslist.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
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
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Login as Admin",
                style: TextStyle(
                  fontSize: 25.0,
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
                      height: 10.0,
                    ),
                    // ignore: deprecated_member_use
                    TextField(
                      keyboardType: TextInputType.name,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Username",
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
                      height: 15.0,
                    ),
                    // ignore: deprecated_member_use
                    TextField(
                      keyboardType: TextInputType.name,
                      controller: passController,
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
                      height: 40.0,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                        color: Colors.blue,
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
                        onPressed: () {
                          if (emailController.text=='admin'&& passController.text=='12345678') {
                            print('done');
  Navigator.push(
    context,
    new MaterialPageRoute(
        builder: (context) =>
            FirebaseUserList()),
  );
}
                        })
                  ],
                ),
              ),

              // ignore: deprecated_member_use

            ],
          ),
        ),
      ),
    );
  }
}
