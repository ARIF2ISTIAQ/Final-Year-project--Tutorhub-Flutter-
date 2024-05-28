import 'package:easy_tutor/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import '../model/notification_setting.dart';
import 'instructorLoginScreen.dart';

class ExpertiseArea extends StatelessWidget {
  final String title = 'Select Expertise Area';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final notifications = [
    NotificationSetting(title: 'Web Development'),
    NotificationSetting(title: 'Mobile Application Development'),
    NotificationSetting(title: 'Programming Language'),
    NotificationSetting(title: 'Game Development'),
    NotificationSetting(title: 'Graphics Design'),

  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Divider(),
            ...notifications.map(buildSingleCheckbox).toList(),
                                SizedBox(
                      height: 80.0,
                    ),

                    
                                RaisedButton(
                                  
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Done",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => MainScreen()),
                          );
                        }),
          ],
        ),
      );



  Widget buildToggleCheckbox(NotificationSetting notification) => buildCheckbox(
    
      notification: notification,
      onClicked: () {
        final newValue = !notification.value;

        setState(() {
          notifications.forEach((notification) {
            notification.value = newValue;
          });
        });
      });

  Widget buildSingleCheckbox(NotificationSetting notification) => buildCheckbox(
        notification: notification,
        onClicked: () {
          setState(() {
            final newValue = !notification.value;
            notification.value = newValue;

            if (!newValue) {

            } else {
              final allow =
                  notifications.every((notification) => notification.value);

            }
          });
        },
      );

  Widget buildCheckbox({
    @required NotificationSetting notification,
    @required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: notification.value,
          onChanged: (value) => onClicked(),
        ),
        title: Text(
          notification.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
      
}