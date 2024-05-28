import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_tutor/model/tutor.dart';

class firebaseTutorService {
  final tutorCollection = FirebaseFirestore.instance.collection('Student');

  //add new tutor
  Future<void> addTutor(Tutor tutor) {
    int id = DateTime.now().microsecondsSinceEpoch;

    if (tutor.studentID == null) {
      tutor.studentID = id;
      tutorCollection.doc(id.toString()).set(tutor.toMap());
    } else {
      tutor.studentID = id;
      tutorCollection.doc(tutor.studentID.toString()).update(tutor.toMap());
    }
  }

  //get all tutors
  Future<List<Tutor>> getTutors() async {
    final snapshot = await tutorCollection.get();
    return snapshot.docs.map((doc) {
      return Tutor.fromMap(doc.data());
    }).toList();
  }

  //get tutor by id
  Future<Tutor> getTutorById(String id) async {
    final doc = await tutorCollection.doc(id).get();
    return Tutor.fromMap(doc.data());
  }

  //delete tutor
  Future<void> deleteTutor(String id) async {
    await tutorCollection.doc(id).delete();
  }

  //update tutor
  Future<void> updateTutor(String id, Tutor tutor) async {
    await tutorCollection.doc(id).update(tutor.toMap());
  }

  //get tutor by email
  Future<Tutor> getTutorByEmail(String email) async {
    final doc = await tutorCollection.where('email', isEqualTo: email).get();
    return Tutor.fromMap(doc.docs.first.data());
  }

  //get tutor by phoneNo
  Future<Tutor> getTutorByPhoneNo(String phoneNo) async {
    final doc =
        await tutorCollection.where('phoneNo', isEqualTo: phoneNo).get();
    return Tutor.fromMap(doc.docs.first.data());
  }

  //get tutor by firstName
  Future<Tutor> getTutorByFirstName(String firstName) async {
    final doc =
        await tutorCollection.where('firstName', isEqualTo: firstName).get();
    return Tutor.fromMap(doc.docs.first.data());
  }
}
