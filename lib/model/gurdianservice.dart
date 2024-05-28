import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_tutor/model/student.dart';

class gurdiianService {
  final gurdianCollection = FirebaseFirestore.instance.collection('Tutor');

//add new gurdian
  Future<void> addGurdian(Student gurdian) {
    int id = DateTime.now().microsecondsSinceEpoch;
    gurdian.studentID = null;
    if (gurdian.studentID == null) {
      gurdian.studentID = id;
      gurdianCollection
          .doc(id.toString())
          .set(gurdian.toMap())
          .onError((error, stackTrace) => 'Error: $error');
    } else {
      gurdianCollection
          .doc(gurdian.studentID.toString())
          .update(gurdian.toMap())
          .onError((error, stackTrace) => print(error));
    }
  }

  //GET ALL GURDIANS
  Future<List<Student>> getGurdians() async {
    final snapshot = await gurdianCollection.get();
    return snapshot.docs.map((doc) {
      return Student.fromMap(doc.data());
    }).toList();
  }

  //BY ID
  Future<Student> getGurdianById(String id) async {
    final doc = await gurdianCollection.doc(id).get();
    return Student.fromMap(doc.data());
  }

  //DELETE GURDIAN
  Future<void> deleteGurdian(String id) async {
    await gurdianCollection.doc(id).delete();
  }

  //UPDATE GURDIAN
  Future<void> updateGurdian(String id, Student gurdian) async {
    await gurdianCollection.doc(id).update(gurdian.toMap());
  }

  //GET BY EMAIL
  Future<Student> getGurdianByEmail(String email) async {
    final doc = await gurdianCollection.where('email', isEqualTo: email).get();
    return Student.fromMap(doc.docs.first.data());
  }
}
