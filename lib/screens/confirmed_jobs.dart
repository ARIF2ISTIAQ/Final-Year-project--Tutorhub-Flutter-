import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutionReqservice.dart';
import 'package:easy_tutor/model/tutionRequest.dart';
import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:easy_tutor/screens/screens/chatscreen.dart';
import 'package:easy_tutor/screens/screens/userdetails.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'confirmed_tutor_request.dart';

class Confirmed_jobs extends StatefulWidget {
  List<Tutor> tutor;
  Confirmed_jobs([this.tutor]);
  @override
  _Confirmed_jobsState createState() => _Confirmed_jobsState();
}

class _Confirmed_jobsState extends State<Confirmed_jobs> {
  List<TutionRequest> getTuitionReq = [];
  List<Student> getStudInfo = [];
  String status_text = "";
  firebaseTutionReq service = new firebaseTutionReq();

  Future<void> showConfirmedTuitionReq() async {
    var result = await http_post('showConfirmedTuitionReq', {
      "tutorEmail": widget.tutor[0].email,
    });
    if (result.data['success'] != null) {
      // setState(() {
      //   getTuitionReq.clear();
      //   getStudInfo.clear();
      //   var in_Req = result.data['success'] as List<dynamic>;
      //   in_Req.forEach((in_Req){
      //     getTuitionReq.add(TutionRequest(
      //       in_Req['id'],
      //       in_Req['category'],
      //       in_Req['daysWeekly'],
      //       in_Req['city'],
      //       in_Req['subject'],
      //       in_Req['salary'],
      //       in_Req['studentEmail'],
      //     ));
      //     getStudInfo.add(Student(
      //       in_Req['FName'],
      //       in_Req['LName'],
      //     ));
      //   });
      // });
      print(getTuitionReq.length);
      print(getTuitionReq[0].studentEmail);
      print(getStudInfo.length);
      print(getStudInfo[0].firstName);
    } else if (result.data["status"] != null) {
      setState(() {
        status_text = result.data["status"];
        getTuitionReq.clear();
        getStudInfo.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.tutor[0].email);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Column(
          children: <Widget>[
            Text(
              'Confirmed Tuition',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                status_text,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<TutionRequest>>(
          future: service.getConfirmed(widget.tutor[0].email),
          builder: (context, snapshot) {
            return snapshot.data == null
                ? CircularProgressIndicator()
                : ListView.separated(
                    itemBuilder: (context, index) => Column(
                      children: [
                        Card(
                              elevation: 2.0,
                              child: ListTile(
                                title: Text(
                                    'Tutor Email: ${snapshot.data[index].tutorEmail}'),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                          'Category: ${snapshot.data[index].category}'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                          'Category: ${snapshot.data[index].city}'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                          'Salary: ${snapshot.data[index].salary}'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                          'Days per week: ${snapshot.data[index].daysWeekly}'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                          'Subject: ${snapshot.data[index].subject}'),
                                    ),
                                  ],
                                  
                                ),
                                //onTap: () {}
                              ),
                            ),
                        Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 130,
                                            alignment: Alignment.bottomCenter,
                                            child: FlatButton(
                                              onPressed: () => {
                                                Utils.openLink(
                                                    url:
                                                        'https://rzp.io/l/pjOUmX9Png'),
                                              },
                                              child: Text(
                                                'Payment to Tutor',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                          Container(
                                            width: 130,
                                            alignment: Alignment.bottomCenter,
                                            child: FlatButton(
                                              onPressed: () async {
                                                {
                                                
                                                }
                                              },
                                              child: Text(
                                                'Chat',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                              color: Colors.orangeAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 130,
                                      alignment: Alignment.bottomCenter,
                                      child: FlatButton(
                                        onPressed: () async {
                                          {
                                            

                                          }
                                        },
                                        child: Text(
                                          'Rate Tutor',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                        color: Colors.pink,
                                      ),
                                    ),
                                  ],
                                ),
                             
                     
                      ],
                    ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: snapshot.data.length);
          }),
    );
  }
}
