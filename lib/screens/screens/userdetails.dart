import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_tutor/model/student.dart';
import 'package:easy_tutor/model/tutor.dart';
import 'package:easy_tutor/screens/instructor_profile.dart';
import 'package:flutter/material.dart';

import '../collections/firebasecollections.dart';
import '../models/reviewmodel.dart';
import '../models/usermodel.dart';

class UserDetails extends StatefulWidget {
  final Tutor userDetails;
  final Student reviewerdetails;
  final String lastscreen;

  UserDetails(this.userDetails, this.reviewerdetails,
      {Key key, this.lastscreen = ""})
      : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  List<ReviewModel> userreviews = [];
  TextEditingController reviewcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reviewcontroller = TextEditingController();
  }

  @override
  void dispose() {
    reviewcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("UserDetails"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            child: Text(
              widget.userDetails.firstName.substring(0, 2),
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            radius: 60,
          ),
          Text("Add Review", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: reviewcontroller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Enter your review"),
            maxLines: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: submitreview, child: Text("Submit Review")),
          Visibility(
            visible: widget.lastscreen == "admin",
            child: IconButton(
              onPressed: () {
                //changeuserstatus(widget.userDetails.active);
              },
              icon:
                  Icon(Icons.power_settings_new_outlined, color: Colors.green),
              iconSize: 80,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "User Reviews",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          StreamBuilder(
              stream: reviewcollectio
                  .where("userid", isEqualTo: widget.userDetails.studentID)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.active) {
                  if (!snapshot.hasData ||
                      snapshot.data == null ||
                      snapshot.data.docs.isEmpty)
                    return Text("No review found");
                  else {
                    userreviews = snapshot.data.docs
                        .map((e) => ReviewModel.fromJson(e.data() as Map))
                        .toList();
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: userreviews.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.person),
                            title: Text(userreviews[index].review),
                            subtitle: Text("~" + userreviews[index].reviewby),
                          );
                        });
                  }
                } else {
                  return Text("No review found");
                }
              })
        ],
      ),
    );
  }

  submitreview() {
    if (reviewcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Enter a valid review")));
      return;
    } else {
      reviewcollectio.add({
        "review": reviewcontroller.text,
        "userid": widget.userDetails.studentID,
        "reviewby": widget.reviewerdetails.firstName
      });
      reviewcontroller.clear();
    }
  }
}
