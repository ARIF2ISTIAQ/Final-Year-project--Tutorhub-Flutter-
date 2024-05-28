// ignore: avoid_web_libraries_in_flutter

import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutor.dart';

import 'package:easy_tutor/modules/http.dart';

import 'package:easy_tutor/screens/instructor_profile.dart';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../model/tutionReqservice.dart';
import '../model/tutionRequest.dart';
import '../model/tutorservice.dart';

class AppointTempStore {
  String fn;
  String ln;
  String sub;
  String sal;
  String cat;
  String pNo;
  String tEmail;
  int rID;
  AppointTempStore(
      {this.fn,
      this.ln,
      this.sub,
      this.sal,
      this.cat,
      this.pNo,
      this.tEmail,
      this.rID});
  AppointTempStore.copy(AppointTempStore from)
      : this(
            fn: from.fn,
            ln: from.ln,
            sub: from.sub,
            sal: from.sal,
            cat: from.cat,
            pNo: from.pNo,
            tEmail: from.tEmail,
            rID: from.rID);
}

firebaseTutionReq service = firebaseTutionReq();

class AppointTutor extends StatefulWidget {
  final List<Student> student;
  AppointTutor([this.student]);

  _AppointTutorState createState() => _AppointTutorState();
}

class _AppointTutorState extends State<AppointTutor> {
  List<TutionRequest> getTuitionReq = [];
  List<Tutor> getTutorInfo = [];
  List<AppointTempStore> temp = [];
  firebaseTutionReq service = new firebaseTutionReq();
  firebaseTutorService service2 = new firebaseTutorService();

  String response_err = "";

  Future<void> appointTutor() async {
    var result = await http_post("appoint-tutor", {
      "studEmail": widget.student[0].email,
    });

    temp.clear();
    int i = 0;

    // if(result.data['success1'] != null)
    // {
    //   setState(() {
    //     getTuitionReq.clear();
    //     var in_Req = result.data['success1'] as List<dynamic>;
    //     in_Req.forEach((in_Req){
    //       getTuitionReq.add(TutionRequest(
    //         in_Req['id'],
    //         in_Req['category'],
    //         in_Req[''],
    //         in_Req[''],
    //         in_Req['subject'],
    //         in_Req['salary'],
    //         in_Req[widget.student[0].email],

    //       ));
    //      temp.add(AppointTempStore(
    //        rID: in_Req['id'],
    //        sub: in_Req['subject'],
    //        sal : in_Req['salary'],
    //        cat: in_Req['category'],

    //      ));

    //     });
    //      print(temp[0].rID);
    //   });
    // }

    if (result.data['success2'] != null) {
      // setState(() {
      //   getTutorInfo.clear();
      //   var info = result.data['success2'] as List<dynamic>;
      //   info.forEach((info){

      //     getTutorInfo.add(Tutor(
      //       info['FName'],
      //       info['LName'],
      //       info['email'],
      //       info[''],
      //       info['P_Num'],
      //       info['about_me'],
      //       info['avail_time_from'],
      //       info['avail_time_to'],
      //       info['expected_Sal'],
      //       info['pref_city'],
      //     ));

      //   temp[i].fn = info['FName'];
      //   temp[i].ln = info['LName'];
      //   temp[i].pNo = info['P_Num'];
      //   temp[i].tEmail = info['email'];
      //   i++;

      //   });
      // });
    }

    if (result.data['fail'] != null) {
      setState(() {
        response_err = result.data['fail'];
      });
      print(response_err);
    }

    // print(temp[0].rID);
    // print(temp[0].tEmail);
    // print(temp[1].rID);
    // print(temp[1].tEmail);
  }

  String responseAppoint = "";
  Future<void> Appoint(int id, String sMail, String tMail) async {
    var result = await http_post("appoint", {
      "stEmail": sMail,
      "tutionReqID": id.toString(),
      "tEmail": tMail,
    });

    if (result.data['status'] != null) {
      setState(() {
        responseAppoint = result.data['status'];
      });
      print(responseAppoint);
    }
    if (responseAppoint != "") {
      Toast.show(responseAppoint, context,
          duration: 3, textColor: Colors.green);
      appointTutor();
    }
  }

  String responseReject = "";
  Future<void> Reject(int id, String sMail, String tMail) async {
    var result = await http_post("delete", {
      "stEmail": sMail,
      "tutionReqID": id.toString(),
      "tEmail": tMail,
    });

    if (result.data['status'] != null) {
      setState(() {
        responseReject = result.data['status'];
      });
      print(responseReject);
    }
    if (responseReject != "") {
      Toast.show(responseReject, context,
          duration: 3, textColor: Colors.redAccent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Column(
          children: <Widget>[
            Text(
              'Appoint Tutor',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '<- Reject',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              '$response_err',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<TutionRequest>>(
          future: service.getPendingedUser(widget.student[0].email),
          builder: (context, snapshot) {
            return ListView.separated(
                itemBuilder: (context, index) => Card(
                      elevation: 2.0,
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        key: ObjectKey(
                          snapshot.data[index],
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            service.updateTutionReq(
                                snapshot.data[index].id.toString(),
                                snapshot.data[index].copyWith(
                                  statusStudent: '1',
                                ));
                          });
                        },
                        background: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 35.0),
                            color: Colors.red,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.delete_forever_sharp,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                Text(
                                  'Reject',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Tutor Email: ${snapshot.data[index].tutorEmail}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                    'For Subject: ${snapshot.data[index].subject} '),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child:
                                    Text('Pay: ${snapshot.data[index].salary}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                    'Category: ${snapshot.data[index].category}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child:
                                    Text('City: ${snapshot.data[index].city}'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 4, 4, 3),
                                    child: FlatButton(
                                      onPressed: () async {
                                        Tutor t = await service2
                                            .getTutorByEmail(snapshot
                                                .data[index].tutorEmail);
                                        return Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return tutorProfile(
                                            t,
                                          );
                                        }));
                                      },
                                      child: Text(
                                        'View Profile',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.deepPurpleAccent[700],
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      service.updateTutionReq(
                                          snapshot.data[index].id.toString(),
                                          snapshot.data[index]
                                              .copyWith(statusStudent: '3'));
                                      setState(() {});
                                    },
                                    child: Text(
                                      snapshot.data[index].statusStudent == 3
                                          ? '  Appointed'
                                          : 'Appoint',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Colors.greenAccent.shade700,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          //   )
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: snapshot.data.length);
          }),
    );
  }
}
