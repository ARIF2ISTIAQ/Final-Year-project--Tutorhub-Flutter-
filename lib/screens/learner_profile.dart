import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentProfile extends StatefulWidget {
  final List<Student> student;
  StudentProfile([this.student]);
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  // List <Student> getStudentInfo = [];

  // Future<void> showStudent() async {
  //   var result = await http_post("view-student-profile",
  //   {
  //   "email" : widget.student[0].email,
  //   }
  //   );
  //   if (result.data['student'] != null) {
  //     setState(() {

  //       getStudentInfo.clear();
  //       var in_Req = result.data['student'] as List<dynamic>;
        
  //       in_Req.forEach((in_Req) { 
  //         getStudentInfo.add(Student(
  //         in_Req['FName'],
  //         in_Req['LName'],
  //         in_Req['email'],
  //         in_Req['password'],
  //         in_Req['P_Num'],

  //         ));
  //       });
  //     });
      
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: RefreshIndicator(
        // onRefresh: showStudent,
        // child: SingleChildScrollView(
          body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
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
                      height: 50,
                      child: ListTile(
                          leading: Icon(Icons.person_pin_outlined),
                          title: Transform.translate(
                            offset: Offset(-16, 0),
                            child: Text('${widget.student[0].firstName}'
                                '${widget.student[0].lastName}'),
                          )),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListTile(
                        leading: Icon(Icons.email_outlined),
                        title: Transform.translate(
                          offset: Offset(-16, 0),
                          child: Text('${widget.student[0].email}'),
                        ),
                      ),
                    ),
                    
                    SizedBox(
                      height: 50,
                      child: ListTile(
                        leading: Icon(Icons.phone_callback_outlined,
                            color: Color.fromRGBO(230, 92, 0, 100)),
                        title: Transform.translate(
                          offset: Offset(-16, 0),
                          child: Text('${widget.student[0].phoneNo}'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      // ),
      floatingActionButton: FloatingActionButton.extended(
          heroTag: null,
          onPressed: () => Navigator.pop(context),
          label: Text('Back'),
          backgroundColor: Colors.indigo,
          icon: Icon(
            Icons.edit_rounded,
          )),
    );
  }
}
