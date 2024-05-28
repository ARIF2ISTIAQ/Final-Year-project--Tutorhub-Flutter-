import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/screens/models/usermodel.dart';
import 'package:easy_tutor/screens/screens/userdetails.dart';
import 'package:easy_tutor/screens/instructor_profile.dart';
import 'package:flutter/material.dart';

import '../../model/tutor.dart';
import '../collections/firebasecollections.dart';
import '../models/chatmodel.dart';

class AppConversation extends StatefulWidget {
  final Tutor userDetails;
  final Student currentuser;

  AppConversation(this.userDetails, this.currentuser, {Key key})
      : super(key: key);

  @override
  State<AppConversation> createState() => _AppConversationState();
}

class _AppConversationState extends State<AppConversation> {
  TextEditingController messagecontroller;

  String chatid = "";

  List<ChatModel> chatlist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messagecontroller = TextEditingController();
    getchatid();
  }

  @override
  void dispose() {
    super.dispose();
    messagecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversations"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserDetails(
                            widget.userDetails, widget.currentuser)));
              },
              icon: Icon(Icons.info))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: conversationcollection
                    .doc(chatid)
                    .collection("chats")
                    .orderBy("date")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return CircularProgressIndicator();
                  else if (snapshot.connectionState == ConnectionState.active) {
                    if (!snapshot.hasData ||
                        snapshot.data == null ||
                        snapshot.data.docs.isEmpty)
                      return Text("No chat found");
                    else {
                      chatlist = snapshot.data.docs
                          .map((e) => ChatModel.fromJson(e.data() as Map))
                          .toList();
                      return ListView.separated(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemCount: chatlist.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: chatlist[index].senderid ==
                                      widget.currentuser.studentID
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: chatlist[index].senderid ==
                                              widget.currentuser.studentID
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: RichText(
                                      text: TextSpan(
                                          text: chatlist[index].message),
                                      textAlign: TextAlign.left,
                                    )),
                              ],
                            );
                          });
                    }
                  } else {
                    return Text("No chat found");
                  }
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messagecontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter a message"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: sendmessage,
                      child: Icon(
                        Icons.send,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  getchatid() {
    int firstid = widget.currentuser.studentID.hashCode;
    int secondid = widget.userDetails.studentID.hashCode;
    print(firstid);
    print(secondid);
    if (firstid > secondid) {
      chatid = widget.currentuser.studentID.toString() +
          widget.userDetails.studentID.toString();
    } else {
      chatid = widget.userDetails.studentID.toString() +
          widget.currentuser.studentID.toString();
    }
  }

  sendmessage() {
    if (messagecontroller.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Enter a valid message")));
      return;
    }
    conversationcollection.doc(chatid).collection("chats").add({
      "message": messagecontroller.text,
      "senderid": widget.currentuser.studentID.toString(),
      "receiverid": widget.userDetails.studentID.toString(),
      "date": DateTime.now().millisecondsSinceEpoch
    });
    messagecontroller.clear();
  }
}
