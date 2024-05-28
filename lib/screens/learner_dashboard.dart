import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/screens/instructor_request.dart';
import 'package:easy_tutor/screens/about_developer.dart';

import 'package:easy_tutor/screens/appointTutor.dart';
import 'package:easy_tutor/screens/confirmed_tutor_request.dart';
import 'package:easy_tutor/screens/ManageTutionRequest.dart';

import 'package:easy_tutor/screens/learner_profile.dart';
import 'package:flutter/material.dart';

import 'learner_profile_edit.dart';

class learner_dashboard extends StatefulWidget {
  @override
  List <Student> student;
  learner_dashboard([this.student]);

  _learner_dashboardState createState() => _learner_dashboardState();
}

class _learner_dashboardState extends State<learner_dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 254, 254, 254),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 220, 51, 172),
        title: Text('Dashboard', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Card(
          child: ListView(
            padding: EdgeInsets.all(1),
            children: <Widget>[
              Container(
                height: 300,
                color:  Colors.pink[50],
                child: DrawerHeader(
                  decoration: BoxDecoration(
                 
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 120,
                        height: 120,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("images/user.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                            child: ListTile(
                              leading: Icon(Icons.person_pin_outlined),
                              title: Align(
                                child: new Text(" ${widget.student[0].firstName} ${widget.student[0].lastName}"),
                                alignment: Alignment(-1.5, 0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ListTile(
                              leading: Icon(Icons.email_outlined),
                              title: Align(
                                child: new Text("${widget.student[0].email}"),
                                alignment: Alignment(-1.5, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.pink[100],
                  child: buildListTiledrawer(
                      "Tuition Request", Icons.group_add_sharp, context, 2),
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: Colors.pink[100],
                  child: buildListTiledrawer("View Profile", Icons.edit_sharp, context, 3)),
              ),
             

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.pink[100],
                  child: buildListTiledrawer("Edit Profile", Icons.edit_sharp, context, 4)),
              ),
            SizedBox(height: 160,),

              FractionallySizedBox(
                widthFactor: 0.4,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 239, 64, 178),
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  child: Text('Sign Out'),
                  onPressed: () => Navigator.popUntil(context,
                      ModalRoute.withName('ULogType')),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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


              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [

                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.all(0.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => manageTutionRequest(widget.student)),
                          );
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color.fromARGB(255, 222, 11, 138), Color.fromARGB(255, 226, 94, 223)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 350,
                              maxHeight: 55,
                            ),
                            alignment: Alignment.center,
                            child: Text("Manage  Requests".toUpperCase(),
                                style: TextStyle(fontSize: 21, color: Colors.white)),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [

                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.all(0.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppointTutor(widget.student)),
                          );
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color.fromARGB(255, 222, 11, 138), Color.fromARGB(255, 226, 94, 223)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 350,
                              maxHeight: 55,
                            ),
                            alignment: Alignment.center,
                            child: Text("Appoint".toUpperCase(),
                                style: TextStyle(fontSize: 21, color: Colors.white)),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [

                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.all(0.0),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Confiremd_tutor_request(widget.student))),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color.fromARGB(255, 222, 11, 138), Color.fromARGB(255, 226, 94, 223)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 350,
                              maxHeight: 55,
                            ),
                            alignment: Alignment.center,
                            child: Text("Confirmed".toUpperCase(),
                                style: TextStyle(fontSize: 21, color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  ListTile buildListTiledrawer(text, icon, BuildContext context, num) {
    return ListTile(
        leading: Icon(icon),
        title: Text(text),
        onTap: () async {
          if (num == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tutor_request(widget.student)),
            );
          }
          if (num == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentProfile(widget.student)),
            );

          }
          if (num == 4) {
            Student returnData = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditStudentProfile(widget.student)),
            );
            if(returnData != null){
              setState(() => widget.student[0]  = returnData);
            }
          }
          if (num == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutDeveloper()),
            );
          }
        });
  }
}
