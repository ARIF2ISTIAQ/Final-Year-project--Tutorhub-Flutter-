import 'dart:convert';



class Student {
  int studentID;
  String firstName;
  String lastName;
  
  String email;
  String password;

  String phoneNo;

  //TutionRequest request;

  Student([
    this.studentID,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNo,
  ]);

  


  Student copyWith({
    int studentID,
    String firstName,
    String lastName,
    String email,
    String password,
    String phoneNo,
  }) {
    return Student(
      studentID ?? this.studentID,
      firstName ?? this.firstName,
      lastName ?? this.lastName,
      email ?? this.email,
      password ?? this.password,
      phoneNo ?? this.phoneNo,
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
  
    return result;
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      map['studentID']?.toInt() ?? 0,
      map['firstName'] ?? '',
      map['lastName'] ?? '',
      map['email'] ?? '',
      map['password'] ?? '',
      map['phoneNo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Student(studentID: $studentID, firstName: $firstName, lastName: $lastName, email: $email, password: $password, phoneNo: $phoneNo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Student &&
      other.studentID == studentID &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.password == password &&
      other.phoneNo == phoneNo;
  }

  @override
  int get hashCode {
    return studentID.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      password.hashCode ^
      phoneNo.hashCode;
  }
}
