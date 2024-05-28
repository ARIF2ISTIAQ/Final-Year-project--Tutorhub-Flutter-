import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/model/tutorservice.dart';
import 'package:easy_tutor/screens/screens/admin.dart';
import 'package:flutter/material.dart';

import '../collections/firebasecollections.dart';
import '../models/usermodel.dart';
import 'chatscreen.dart';

class FirebaseUserList extends StatefulWidget {
  FirebaseUserList({Key key}) : super(key: key);

  @override
  State<FirebaseUserList> createState() => _FirebaseUserListState();
}

class _FirebaseUserListState extends State<FirebaseUserList> {
  List<Tutor> appusers = [];

  firebaseTutorService service = firebaseTutorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: Text("App Users"),
        elevation: 1,
        backgroundColor: Colors.blue,
        actions: [],
      ),
      body: FutureBuilder<List<Tutor>>(
          future: service.getTutors(),
          builder: (context, snapshot) {
           return snapshot.data==null? CircularProgressIndicator(): ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                            onLongPress: () {
                              //delete
                              service.deleteTutor(
                                  snapshot.data[index].studentID.toString());
                              snapshot.data.removeAt(index);
                              setState(() {});
                            },
                            tileColor: Colors.grey.shade100,
                            // onTap: () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => AppConversation(
                            //             snapshot.data[index], snapshot.data[0]))),
                            leading: CircleAvatar(
                              backgroundColor: Colors.primaries[index],
                              child:
                                  Text(snapshot.data[index].firstName.substring(0, 2)),
                            ),
                            title: Text(
                              snapshot.data[index].lastName,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                    ));
  }),
    );
  }
}
