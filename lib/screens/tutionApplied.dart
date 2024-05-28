import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutionReqservice.dart';
import 'package:easy_tutor/model/tutionRequest.dart';
import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/model/tutorservice.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class TutionAppliedScreen extends StatefulWidget {
  List<Tutor> tutor;
  TutionAppliedScreen([this.tutor]);
  @override
  _TutionAppliedScreenState createState() => _TutionAppliedScreenState();
}

class _TutionAppliedScreenState extends State<TutionAppliedScreen> {
  List<TutionRequest> getTuitionReq = [];
  List<Student> getStudInfo = [];
  int tuitionReqID;
  String studentFName = "";
  String studentLName = "";
  String status_text = "";

  // Future<void> showAppliedTuitionReq()async{
  //   var result = await http_post('showAppliedTuitionReq',{
  //     "tutorEmail": widget.tutor[0].email,
  //   });
  //   if(result.data['success'] != null)
  //   // {
  //   //   setState(() {
  //   //     getTuitionReq.clear();
  //   //     getStudInfo.clear();
  //   //     var in_Req = result.data['success'] as List<dynamic>;
  //   //     in_Req.forEach((in_Req){
  //   //       getTuitionReq.add(TutionRequest(
  //   //         in_Req['id'],
  //   //         in_Req['category'],
  //   //         in_Req['daysWeekly'],
  //   //         in_Req['city'],
  //   //         in_Req['subject'],
  //   //         in_Req['salary'],
  //   //         in_Req['studentEmail'],
  //   //       ));
  //   //       getStudInfo.add(Student(
  //   //         in_Req['FName'],
  //   //         in_Req['LName'],
  //   //       ));
  //   //     });
  //   //   });
  //   //   print(getTuitionReq.length);
  //   //   print(getTuitionReq[0].studentEmail);
  //   //   print(getStudInfo.length);
  //   //   print(getStudInfo[0].firstName);
  //   // }
  //   // else if(result.data['status'] != null){
  //   //   setState(() {
  //   //     status_text = result.data['status'];
  //   //     getTuitionReq.clear();
  //   //     getStudInfo.clear();
  //   //   });
  //   // }
  // }

  void undoAppliedTuitionReq() async {
    var result = await http_post('undoAppliedTuitionReq', {
      "tutorEmail": widget.tutor[0].email,
      "tuitionReqID": tuitionReqID,
    });
    if (result.data['success'] != null) {
      Toast.show(
          "Application for " + studentFName + " " + studentLName + " removed",
          context,
          duration: 3,
          textColor: Colors.lightGreen);
      //showAppliedTuitionReq();
    } else {
      Toast.show("Unresolved error", context,
          duration: 3, textColor: Colors.redAccent);
    }
  }

  firebaseTutionReq service = firebaseTutionReq();

  @override
  Widget build(BuildContext context) {
    print(widget.tutor[0].email);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Column(
          children: <Widget>[
            Text(
              'Tuition Applied',
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
            )
          ],
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<TutionRequest>>(
          future: service.getByemail(widget.tutor[0].email),
          builder: (context, snapshot) {
            print(snapshot.data);
            return snapshot.data == null
                ? CircularProgressIndicator()
                : ListView.separated(
                    itemBuilder: (context, index) => Card(
                          elevation: 2.0,
                          child: ListTile(
                              title: Text(
                                  'Tutor Email: ${snapshot.data[index].studentEmail}}'),
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
                              trailing: FlatButton(
                                onPressed: () => {
                                  setState(() {
                                    service.updateTutionReq(
                                        snapshot.data[index].id.toString(),
                                        snapshot.data[index].copyWith(
                                            tutorEmail: '',
                                            statusStudent: '0'));
                                  }),
                                },
                                child: Text(
                                  'Undo Apply',
                                  style: TextStyle(color: Colors.black),
                                ),
                                color: Colors.red,
                              )
                              //onTap: () {}
                              ),
                        ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: snapshot.data.length);
          }),
    );
  }
}
