import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/model/tutorservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class tutorProfile extends StatefulWidget {
  Tutor tutor;
  tutorProfile([this.tutor]);
  @override
  _tutorProfileState createState() => _tutorProfileState();
}

class _tutorProfileState extends State<tutorProfile> {
  // Tutor getTutor;

  Future<Tutor> showTutor() async {
    firebaseTutorService getTutor = firebaseTutorService();
    return getTutor.getTutorById(widget.tutor.studentID.toString());
  }

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print("initState");
  //   // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   //   print("WidgetsBinding");
  //   // });
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     showTutor();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //print(widget.tutor[0].email);
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.pink[400],
  title: Text("Profile"),
  leading: GestureDetector(
      onTap: () { /* Write listener code here */ },
      child: Icon(
        Icons.exit_to_app_rounded,  // add custom icons also
      ),
  ),
  actions: <Widget>[
    Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.search,
          size: 26.0,
        ),
      )
    ),
    Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {},
        child: Icon(
            Icons.more_vert
        ),
      )
    ),
  ],
),
      body: SingleChildScrollView(
        child: FutureBuilder<Tutor>(
            future: showTutor(),
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? CircularProgressIndicator()
                  : Container(
                      color: Colors.blue[50],
                     height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                              child: Container(
                            color: Colors.blue[50],
                            padding: EdgeInsets.only(top: 30.0),
                            height: 300,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 150,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage("images/user.png"),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      child: ListTile(
                                          leading:
                                              Icon(Icons.person_pin_outlined),
                                          title: Transform.translate(
                                            offset: Offset(-16, 0),
                                            child: Text(
                                                '${snapshot.data.firstName} ${snapshot.data.lastName}'),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: ListTile(
                                        leading: Icon(Icons.email_outlined),
                                        title: Transform.translate(
                                          offset: Offset(-16, 0),
                                          child: Text('${snapshot.data.email}'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: ListTile(
                                          leading: Icon(
                                            Icons.pageview_rounded,
                                          ),
                                          title: Transform.translate(
                                            offset: Offset(-16, 0),
                                            child: Text(
                                                '${snapshot.data.phoneNo}'),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                          Card(
                            child: Container(
                              height: 300,
                              color: Colors.blue[50],
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "About Me",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Text("${snapshot.data.aboutMe}"),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              color: Colors.blue[50],
                              child: Column(
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Text(
                                  //     "Availablity",
                                  //     style: TextStyle(
                                  //         fontWeight: FontWeight.bold, fontSize: 20),
                                  //   ),
                                  // ),
                                  // Column(
                                  //   children: [
                                  //     availablity("Avilable Time From    :",
                                  //         '${snapshot.data.availTimeFrom}'),
                                  //     availablity("Avilable Time To      :",
                                  //         '${snapshot.data.availTimeTo}'),
                                  //     availablity("Expected Salary        :",
                                  //         '${snapshot.data.expectedSal}'),
                                  //     availablity("Prefered Location      :",
                                  //         '${snapshot.data.prefLocation}'),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            }),
      ),
    );
  }

  Container availablity(lead, trail) {
    return Container(
        child: ListTile(
      leading: Icon(Icons.adjust_sharp),
      title: Text(lead),
      trailing: Text(trail),
    )
        // Row(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(lead),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(trail),
        //     )
        //   ],
        // ),
        );
  }
}
