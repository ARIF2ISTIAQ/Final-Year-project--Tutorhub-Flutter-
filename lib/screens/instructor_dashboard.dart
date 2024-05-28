import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/screens/about_developer.dart';

import 'package:easy_tutor/screens/confirmed_jobs.dart';
import 'package:easy_tutor/screens/jobBoard.dart';
import 'package:easy_tutor/screens/tutionApplied.dart';
import 'package:easy_tutor/screens/instructor_profile.dart';
import 'package:easy_tutor/screens/instructor_profile_edit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class instructor_dashboard extends StatefulWidget {
  List <Tutor> tutor;
  instructor_dashboard([this.tutor]);
  @override
  _instructor_dashboardState createState() => _instructor_dashboardState();
}

class _instructor_dashboardState extends State<instructor_dashboard> {
  @override
  Widget build(BuildContext context) {
    print(widget.tutor[0].email);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 253, 253, 253),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 232, 64, 215),
        title: Text('Dashboard', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Card(
          child: ListView(
            padding: EdgeInsets.all(1),
            children: <Widget>[
              Container(
                height: 220,
                color: Colors.pink[50],
                child: DrawerHeader(
                  decoration: BoxDecoration(
                  
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 110,
                        height: 90,
                        alignment: Alignment.center,
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
                                child: new Text(" ${widget.tutor[0].firstName} ${widget.tutor[0].lastName}"),
                                alignment: Alignment(-1.5, 0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ListTile(
                              leading: Icon(Icons.email_outlined),
                              title: Align(
                                child: new Text("  ${widget.tutor[0].email}"),
                                alignment: Alignment(-1.95, 0),
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
                  color: Colors.pink[200],
                  child: buildListTiledrawer(
                      "Search Tutor", Icons.group_add_sharp, context, 2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.pink[200],

                  child: buildListTiledrawer(
                      "View Profile", Icons.edit_sharp, context, 3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.pink[200],

                  child: buildListTiledrawer(
                      "Edit Profile", Icons.edit_sharp, context, 4),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.pink[200],

                  child: buildListTiledrawer(
                      "About", Icons.info_outline_rounded, context, 5),
                ),
              ),
              SizedBox(height: 150),
              FractionallySizedBox(
                widthFactor: 0.4,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 241, 55, 213),
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  child: Text('Sign Out'),
                  onPressed: () =>  Navigator.popUntil(context,
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
          decoration: BoxDecoration(
          
        ),
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
              SizedBox(height: 100,),
              Container(
                height: 350,

                decoration: BoxDecoration(
                                  color: Colors.pink[700],
                  borderRadius: BorderRadius.only(
        topLeft: Radius.circular(60.0) ,//                 <--- border radius here
        topRight: Radius.circular(60.0) ,//                 <--- border radius here
    ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TutionAppliedScreen(widget.tutor)),
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
                                    maxWidth: 120,
                                    maxHeight: 120,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text("Applied".toUpperCase(),
                                      style: TextStyle(fontSize: 18, color: Colors.white)),
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(width: 20,), 
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Confirmed_jobs(widget.tutor)));
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
                                maxWidth: 120,
                                maxHeight: 120,
                              ),
                              alignment: Alignment.center,
                              child: Text("Confirmed".toUpperCase(),
                                  style: TextStyle(fontSize: 18, color: Colors.white)),
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

           
            ],
          ),
        ),
      ),
    );
  }

  Card buildCardDashboard(icon, first, second) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Container(
        height: 60,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Icon(icon),
                Text(
                  '  ' + first,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Text("    " + second, style: TextStyle(fontSize: 10))
          ],
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
              MaterialPageRoute(builder: (context) => JobBoardScreen(widget.tutor)),
            );
          }
          if (num == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tutorProfile(widget.tutor[0])),
            );
          }
          if (num == 4) {
            Tutor returnData = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditTutorProfile(widget.tutor)),
            );
            if(returnData != null){
              setState(() => widget.tutor[0]  = returnData);
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
