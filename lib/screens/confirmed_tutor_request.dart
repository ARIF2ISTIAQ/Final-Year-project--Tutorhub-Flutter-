import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutionReqservice.dart';
import 'package:easy_tutor/model/tutionRequest.dart';
import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/model/tutorservice.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:easy_tutor/screens/screens/chatscreen.dart';
import 'package:easy_tutor/screens/screens/userdetails.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future openLink({String url}) => _launchUrl(url);

  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}

class Confiremd_tutor_request extends StatefulWidget {
  @override
  final List<Student> student;
  Confiremd_tutor_request([this.student]);
  _Confiremd_tutor_requestState createState() =>
      _Confiremd_tutor_requestState();
}

class _Confiremd_tutor_requestState extends State<Confiremd_tutor_request> {
  List<TutionRequest> getTuitionReq = [];
  List<Tutor> getTutorInfo = [];
  String status_text = "";
  firebaseTutorService service2 = firebaseTutorService();
  firebaseTutionReq service = new firebaseTutionReq();

  Future<void> showAppointedTuitionReq() async {
    var result = await http_post('showAppointedTuitionReq', {
      "studentEmail": widget.student[0].email,
    });
    if (result.data['success'] != null) {
      // setState(() {
      //   getTuitionReq.clear();
      //   getTutorInfo.clear();
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
      //     getTutorInfo.add(Tutor(
      //       in_Req['FName'],
      //       in_Req['LName'],
      //     ));
      //   });
      // });
      print(getTuitionReq.length);
      print(getTuitionReq[0].studentEmail);
      print(getTutorInfo.length);
      print(getTutorInfo[0].firstName);
    } else if (result.data["status"] != null) {
      setState(() {
        status_text = result.data["status"];
        getTuitionReq.clear();
        getTutorInfo.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.student[0].email);
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
          future: service.getConfirmedUser(widget.student[0].email),
          builder: (context, snapshot) {
            return snapshot.data == null
                ? CircularProgressIndicator()
                : ListView.separated(
                    itemBuilder: (context, index) => Card(
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
                                                'Payment Details',
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
                                                  Tutor tut = await service2
                                                      .getTutorByEmail(snapshot
                                                          .data[index]
                                                          .tutorEmail);

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AppConversation(
                                                                tut,
                                                                widget
                                                                    .student[0],
                                                              )));
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
                                            Tutor tut = await service2
                                                .getTutorByEmail(snapshot
                                                    .data[index].tutorEmail);

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UserDetails(
                                                          tut,
                                                          widget.student[0],
                                                        )));
                                          }
                                        },
                                        child: Text(
                                          'View Student',
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
                            //onTap: () {}
                          ),
                        ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: snapshot.data.length);
          }),
    );
  }
}
