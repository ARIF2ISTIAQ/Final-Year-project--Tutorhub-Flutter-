import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutionReqservice.dart';
import 'package:easy_tutor/model/tutionRequest.dart';
import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/modules/http.dart';
import 'package:easy_tutor/screens/instructor_profile.dart';
import 'package:flutter/material.dart';
import 'package:easy_tutor/screens/sievePage.dart';
import 'package:toast/toast.dart';

class JobBoardScreen extends StatefulWidget {
  List<Tutor> tutor;
  JobBoardScreen([this.tutor]);
  @override
  _JobBoardScreenState createState() => _JobBoardScreenState();
}

class _JobBoardScreenState extends State<JobBoardScreen> {
  List<TutionRequest> getTuitionReq = [];
  List<Student> getStudInfo = [];
  List in_ApplyStatusReq = [];
  List buttonName = [];
  List<Color> buttonClr = [];
  String studentEmail = "";
  int tuitionID;
  firebaseTutionReq service = firebaseTutionReq();
  Future<List<TutionRequest>> showTuitionReq() async {
    getTuitionReq = await service.getTutionReqs();

    buttonClr.clear();

    print(in_ApplyStatusReq);
    print(buttonName);
    return getTuitionReq;
  }

  void applyTuitionReq() async {
    var result = await http_post('applyTuitionReq', {
      "studEmail": studentEmail,
      "tutorEmail": widget.tutor[0].email,
      "tuitionReq_ID": tuitionID,
    });
    if (result.data['success'] != null) {
      Toast.show(result.data["success"], context,
          duration: 3, textColor: Colors.lightGreen);
      showTuitionReq();
    } else if (result.data["status"] != null) {
      Toast.show(result.data["status"], context,
          duration: 3, textColor: Colors.redAccent);
    } else {
      Toast.show("Unresolved error", context,
          duration: 3, textColor: Colors.redAccent);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.tutor[0].email);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 225, 67, 191),
          title: Column(
            children: <Widget>[
              Text(
                'Search Tutor',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'List of available jobs',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<List<TutionRequest>>(
            future: service.getTutionReqs(),
            builder: (context, snapshot) {
              print(snapshot.data);

              return snapshot.data == null
                  ? CircularProgressIndicator()
                  : ListView.separated(
                      itemBuilder: (context, index) => Card(
                            elevation: 2.0,
                            child: ListTile(
                                title: Text(
                                    'Tutor Email: ${snapshot.data[index].studentEmail} '),
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
                                          'City: ${snapshot.data[index].city}'),
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
                                    if (snapshot.data[index].tutorEmail !=
                                        widget.tutor[0].email)
                                      {
                                        service.updateTutionReq(
                                            snapshot.data[index].id.toString(),
                                            snapshot.data[index].copyWith(
                                              statusStudent: '2',
                                                tutorEmail:
                                                    widget.tutor[0].email))
                                        // applyTuitionReq(),
                                      }
                                    else
                                      {
                                        Toast.show(
                                          "You have already applied for this job",
                                          context,
                                          duration: 3,
                                        ),
                                      }
                                  },
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Color.fromARGB(255, 231, 65, 150),
                                )
                                //onTap: () {}
                                ),
                          ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: snapshot.data.length);
            }),
        floatingActionButton: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              heroTag: null,
              backgroundColor: Colors.indigo,
              onPressed: () => Navigator.pop(context),
              label: Text("Back"),
              icon: Icon(Icons.west),
            ),
            // FloatingActionButton.extended(
            //     heroTag: null,
            //     onPressed: () => Navigator.pop(context),
            //     label: Text('Back'),
            //     backgroundColor: Colors.indigo,
            //     icon: Icon(
            //       Icons.keyboard_backspace,
            //     ))
          ],
        ));
  }
}
