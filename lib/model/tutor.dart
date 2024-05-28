import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Tutor {
  int studentID;
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNo;
  String aboutMe;
  String availTimeFrom;
  String availTimeTo;
  String expectedSal;
  String prefLocation;

  Tutor({
    this.studentID,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNo,
    this.aboutMe,
    this.availTimeFrom,
    this.availTimeTo,
    this.expectedSal,
    this.prefLocation,
  });

  Tutor copyWith({
    int studentID,
    String firstName,
    String lastName,
    String email,
    String password,
    String phoneNo,
    String aboutMe,
    
  }) {
    return Tutor(
      studentID: studentID ?? this.studentID,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNo: phoneNo ?? this.phoneNo,
      aboutMe: aboutMe ?? this.aboutMe,
     
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'studentID': studentID});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'phoneNo': phoneNo});
    result.addAll({'aboutMe': aboutMe});
   

    return result;
  }

  factory Tutor.fromMap(Map<String, dynamic> map) {
    return Tutor(
      studentID: int.parse(map['studentID'].toString()),
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
      phoneNo: map['phoneNo'],
      aboutMe: map['aboutMe'],
      
    );
  }

  String toJson() => json.encode(toMap());

  factory Tutor.fromJson(String source) => Tutor.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tutor(studentID: $studentID, firstName: $firstName, lastName: $lastName, email: $email, password: $password, phoneNo: $phoneNo, aboutMe: $aboutMe, availTimeFrom: $availTimeFrom, availTimeTo: $availTimeTo, expectedSal: $expectedSal, prefLocation: $prefLocation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tutor &&
        other.studentID == studentID &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.password == password &&
        other.phoneNo == phoneNo &&
        other.aboutMe == aboutMe &&
        other.availTimeFrom == availTimeFrom &&
        other.availTimeTo == availTimeTo &&
        other.expectedSal == expectedSal &&
        other.prefLocation == prefLocation;
  }

  @override
  int get hashCode {
    return studentID.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phoneNo.hashCode ^
        aboutMe.hashCode ^
        availTimeFrom.hashCode ^
        availTimeTo.hashCode ^
        expectedSal.hashCode ^
        prefLocation.hashCode;
  }

  // from Snapshot DocumentSnapshot snap

  Tutor.fromSnapshot(DocumentSnapshot snap) {
    Map data = snap.data();
    print('Data $data');
    studentID = int.parse(data['studentID']);
    firstName = data['firstName'];
    lastName = data['lastName'];
    email = data['email'];
    password = data['password'];
    phoneNo = data['phoneNo'];
    aboutMe = data['aboutMe'];
    
  }
  //to document
  Map<String, dynamic> toDocument() {
    return <String, dynamic>{
      'studentID': studentID,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phoneNo': phoneNo,
      'aboutMe': aboutMe,
      
      
    };
  }
}
