import 'dart:ui';

import 'package:flutter/material.dart';

//! For Category sort
class Category {
  String title;
  String value;

  Category(this.title, this.value);
}
// list of class Category
List<Category> categories = [
  Category('Empty', ''),
  Category('Online', 'onlone'),
  Category('Face-to-Face', 'facetoface')
];

//! For DaysPerWeek sort
  class DaysPerWeek {
    String  title;
    String  value;  

    DaysPerWeek(this.title, this.value);
  }
// List of class DaysPerWeek
List <DaysPerWeek> daysPerWeekList = [
  DaysPerWeek('Empty', ''),
  DaysPerWeek('1 day', '1day'),
  DaysPerWeek('2 days','2days'),
  DaysPerWeek('3 days','3days'),
  DaysPerWeek('4 days','4days'),
  DaysPerWeek('5 days','5days'),
  DaysPerWeek('6 days','6days'),
  DaysPerWeek('7 days','7days'),
];   

//! For City sort
  class City {
    String  title;
    String  value;  

    City(this.title, this.value);
  }
// List of class City
List <City> cities = [
  City('Empty', ''),
  City('Johor Bahru', 'jb'),
  City('Melacca City','mc'),
  City('Kuala Lampur','kl'),
  City('George Town','gt'),
  City('Kota Kinabalu','kk'),
  City('Alor Setar','as'),
  City('Shah Alam','sa'),
];   

//! For Subject sort
  class Subject {
    String  title;
    String  value;  

    Subject(this.title, this.value);
  }
// List of class Subject
List <Subject> subjects = [
 Subject('Empty', ''),
 Subject('Physics', 'phy'),
 Subject('Chemistry','chem'),
 Subject('Biology','bio'),
 Subject('Mathematics','math'),
 Subject('Computing','com'),
 Subject('Engineering','eng'),
 Subject('Ielts','ielts'),
 Subject('SAT','sat'),
];   


class SieveScreen extends StatefulWidget {
  @override
  _SieveScreenState createState() => _SieveScreenState();
}

class _SieveScreenState extends State<SieveScreen> {
  //! variables locally declared
  //? will be substituted by database
  String categoryValue = '';
  String daysPerWeekValue= '';
  String cityValue = '';
  String subjectValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              'Filter By',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(60.0, 10.0, 45.0, 0.0),
            child: Text(
              'Filter by Category',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Card(
              margin: EdgeInsets.fromLTRB(42.0, 10.0, 45.0, 20.0),
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(80.0, 2.0, 80.0, 2.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: categoryValue,
                  //? used to construct dropdown menu
                  items: categories
                      .map((Category category) => DropdownMenuItem(
                            child: Text(category.title),
                            value: category.value,
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      categoryValue = newValue;
                    });
                  },
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(60.0, 10.0, 45.0, 0.0),
            child: Text(
              'Days per Week',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Card(
              margin: EdgeInsets.fromLTRB(42.0, 10.0, 45.0, 20.0),
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(80.0, 2.0, 80.0, 2.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: daysPerWeekValue,
                  items: daysPerWeekList
                      .map((DaysPerWeek daysPerWeek) => DropdownMenuItem(
                            child: Text(daysPerWeek.title),
                            value: daysPerWeek.value,
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      daysPerWeekValue = newValue;
                    });
                  },
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(60.0, 10.0, 45.0, 0.0),
            child: Text(
              'City',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Card(
              margin: EdgeInsets.fromLTRB(42.0, 10.0, 45.0, 20.0),
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(80.0, 2.0, 80.0, 2.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: cityValue,
                  items: cities
                      .map((City city) => DropdownMenuItem(
                            child: Text(city.title),
                            value: city.value,
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      cityValue = newValue;
                    });
                  },
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(60.0, 10.0, 45.0, 0.0),
            child: Text(
              'Subject',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Card(
              margin: EdgeInsets.fromLTRB(42.0, 10.0, 45.0, 20.0),
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(80.0, 2.0, 80.0, 2.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: subjectValue,
                  items:subjects
                      .map((Subject subject) => DropdownMenuItem(
                            child: Text(subject.title),
                            value: subject.value,
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      subjectValue = newValue;
                    });
                  },
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pop(context),
        label: Text('Confirm Filter'),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
