import 'dart:convert';

class TutionRequest {
  int id;
  String category;
  String daysWeekly;
  String city;
  String subject;
  String studentClass;
  String time;
  String salary;
  String tutorEmail;
  String studentEmail;
  String statusStudent;

  TutionRequest({
    this.id,
    this.category,
    this.daysWeekly,
    this.city,
    this.subject,
    this.studentClass,
    this.time,
    this.salary,
    this.tutorEmail,
    this.studentEmail,
    this.statusStudent,
  });

  TutionRequest copyWith({
    int id,
    String category,
    String daysWeekly,
    String city,
    String subject,
    String studentClass,
    String time,
    String salary,
    String tutorEmail,
    String studentEmail,
    String statusStudent,
  }) {
    return TutionRequest(
      id: id ?? this.id,
      category: category ?? this.category,
      daysWeekly: daysWeekly ?? this.daysWeekly,
      city: city ?? this.city,
      subject: subject ?? this.subject,
      studentClass: studentClass ?? this.studentClass,
      time: time ?? this.time,
      salary: salary ?? this.salary,
      tutorEmail: tutorEmail ?? this.tutorEmail,
      studentEmail: studentEmail ?? this.studentEmail,
      statusStudent: statusStudent ?? this.statusStudent,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'category': category});
    result.addAll({'daysWeekly': daysWeekly});
    result.addAll({'city': city});
    result.addAll({'subject': subject});
    result.addAll({'studentClass': studentClass});
    result.addAll({'time': time});
    result.addAll({'salary': salary});
    result.addAll({'tutorEmail': tutorEmail});
    result.addAll({'studentEmail': studentEmail});
    result.addAll({'statusStudent': statusStudent});

    return result;
  }

  factory TutionRequest.fromMap(Map<String, dynamic> map) {
    return TutionRequest(
      id: map['id'],
      category: map['category'],
      daysWeekly: map['daysWeekly'],
      city: map['city'],
      subject: map['subject'],
      studentClass: map['studentClass'],
      time: map['time'],
      salary: map['salary'],
      tutorEmail: map['tutorEmail'],
      studentEmail: map['studentEmail'],
      statusStudent: map['statusStudent'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TutionRequest.fromJson(String source) =>
      TutionRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TutionRequest(id: $id, category: $category, daysWeekly: $daysWeekly, city: $city, subject: $subject, studentClass: $studentClass, time: $time, salary: $salary, tutorEmail: $tutorEmail, studentEmail: $studentEmail, statusStudent: $statusStudent)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TutionRequest &&
        other.id == id &&
        other.category == category &&
        other.daysWeekly == daysWeekly &&
        other.city == city &&
        other.subject == subject &&
        other.studentClass == studentClass &&
        other.time == time &&
        other.salary == salary &&
        other.tutorEmail == tutorEmail &&
        other.studentEmail == studentEmail &&
        other.statusStudent == statusStudent;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category.hashCode ^
        daysWeekly.hashCode ^
        city.hashCode ^
        subject.hashCode ^
        studentClass.hashCode ^
        time.hashCode ^
        salary.hashCode ^
        tutorEmail.hashCode ^
        studentEmail.hashCode ^
        statusStudent.hashCode;
  }
}
