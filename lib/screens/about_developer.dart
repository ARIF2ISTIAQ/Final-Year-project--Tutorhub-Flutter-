import 'package:flutter/material.dart';

class AboutDeveloper extends StatefulWidget {
  const AboutDeveloper({Key key}) : super(key: key);

  @override
  _AboutDeveloperState createState() => _AboutDeveloperState();
}


Widget about = Card(
  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
       
        Text(
          "This application’s goal is to allow users to find a qualified tutor based on their subjects. In this application, the users can search tutors based on area, check tutor’s education background and also can-do live chat with tutors if the user wants to",
          style: TextStyle(
            fontSize: 15,
            color: Colors.blueGrey[800],
          ),
        ),
      ],

    ),
  ),
);
Widget about1 = Card(
  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
       
        Text(
          "The importance of this application is that the users have this application and can easily search for a tutor whenever they need one. It will reduce their work of finding a tutor and they can focus on their study. It is also very convenient for the students and tutor",
          style: TextStyle(
            fontSize: 15,
            color: Colors.blueGrey[800],
          ),
        ),
      ],

    ),
  ),
);
Widget about2 = Card(
  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
       
        Text(
          "Whenever finding a tutor, As we know that, a good tutor is very  helpful for a student. Because, a tutor will improve his student’s academic  performance, improves attention and confidence towards learning through his good  tutoring qualities. Furthermore, a good tutor will also improve his students work and  study habits, and improve his social and behavioural skills. ",
          style: TextStyle(
            fontSize: 15,
            color: Colors.blueGrey[800],
          ),
        ),
      ],

    ),
  ),
);



class _AboutDeveloperState extends State<AboutDeveloper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 165, 26, 112),
        title: Text("About"),
        centerTitle: true,
      ),
      body: (Column(
        children: <Widget>[about,about1,],
      )),
    );
  }
}
