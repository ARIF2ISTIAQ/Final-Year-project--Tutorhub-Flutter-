import 'package:flutter/material.dart';

import 'about_developer.dart';

class About extends StatefulWidget {
  About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  Widget textSection = Container(
    padding: const EdgeInsets.all(15),
    child: Text(
      "Easy Tuition's is a service provided by Xcoders.dev. This is Malaysia's first ever online platform for tutors & students.It helps students to find verified and skilled tutors for in-person and online tuition.",
      softWrap: true,
      style: TextStyle(fontSize: 20),
    ),
  );

  // ignore: deprecated_member_use
  Widget contactPhone = FlatButton.icon(
      onPressed: () {},
      icon: Icon(Icons.contact_phone_rounded),
      label: Text("Phone Us"));

  // ignore: deprecated_member_use
  Widget contactEmail = FlatButton.icon(
      onPressed: () {},
      icon: Icon(Icons.email_rounded),
      label: Text("E-mail Us "));

  // ignore: deprecated_member_use

  @override
  Widget build(BuildContext context) {
    Widget importantNotes = FlatButton.icon(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => AboutDeveloper())),
      icon: Icon(Icons.emoji_people_rounded),
      label: Text('About Developer'),
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("About Us"),
        centerTitle: true,
        backgroundColor: Colors.pink,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.network(
                "https://scontent.fdac14-1.fna.fbcdn.net/v/t1.6435-9/184812110_4557765010926569_3185839610928397113_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=730e14&_nc_ohc=yJQ78WO0p7QAX_fV-Xd&_nc_ht=scontent.fdac14-1.fna&oh=f172dcc18d56c914db9aa553fd471aad&oe=60C680A5",
                width: 300,
                height: 240,
                fit: BoxFit.contain,
              ),
            ),
            Divider(
              height: 50,
              color: Colors.grey,
            ),
            textSection,
            Row(
              children: <Widget>[
                contactPhone,
                SizedBox(width: 80),
                contactEmail,
              ],
            ),
            importantNotes,
          ],
        ),
      ),
    );
  }
}
