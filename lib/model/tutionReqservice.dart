import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_tutor/model/tutionRequest.dart';

class firebaseTutionReq {
  final tutionReqCollection =
      FirebaseFirestore.instance.collection('TutionReq');

  //add new tutorreq
  Future<void> addTutionReq(TutionRequest tutionReq) {
    int id = DateTime.now().microsecondsSinceEpoch;

    if (tutionReq.id == null) {
      tutionReq.id = id;
      tutionReqCollection.doc(id.toString()).set(tutionReq.toMap());
    } else {
      tutionReqCollection
          .doc(tutionReq.id.toString())
          .update(tutionReq.toMap());
    }
  }

  //get all TutionRequest
  Future<List<TutionRequest>> getTutionReqs() async {
    try {
      final snapshot = await tutionReqCollection.get();
      return snapshot.docs.map((doc) {
        print(doc.data());
        return TutionRequest.fromMap(doc.data());
      }).toList();
    } on Exception catch (e) {
      print(e);
    }
  }

  //get TutionRequest by id
  Future<TutionRequest> getTutionReqById(String id) async {
    final doc = await tutionReqCollection.doc(id).get();
    return TutionRequest.fromMap(doc.data());
  }

  //delete TutionRequest
  Future<void> deleteTutionReq(String id) async {
    await tutionReqCollection.doc(id).delete();
  }

  //update TutionRequest
  Future<void> updateTutionReq(String id, TutionRequest tutionReq) async {
    await tutionReqCollection.doc(id).update(tutionReq.toMap());
  }

  //get TutionRequest by email
  Future<List<TutionRequest>> getTutionReqByEmail(String email) async {
    final doc =
        await tutionReqCollection.where('tutorEmail', isEqualTo: email).get();
    return doc.docs.map((doc) {
      TutionRequest.fromMap(doc.data());
      print(TutionRequest.fromMap(doc.data()));
    }).toList();
  }

  Future<List<TutionRequest>> getByemail(email) async {
    try {
      final snapshot =
          await tutionReqCollection.where('tutorEmail', isEqualTo: email).get();
      return snapshot.docs.map((doc) {
        print(doc.data());
        return TutionRequest.fromMap(doc.data());
      }).toList();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<TutionRequest>> getByemailUser(email) async {
    try {
      final snapshot = await tutionReqCollection
          .where('studentEmail', isEqualTo: email)
          .get();
      return snapshot.docs.map((doc) {
        print(doc.data());
        return TutionRequest.fromMap(doc.data());
      }).toList();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<TutionRequest>> getConfirmed(email) async {
    try {
      final snapshot = await tutionReqCollection
          .where('tutorEmail', isEqualTo: email)
          .where('statusStudent', isEqualTo: '3')
          .get()
          .onError((error, stackTrace) => null);
      return snapshot.docs.map((doc) {
        print(doc.data());
        return TutionRequest.fromMap(doc.data());
      }).toList();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<TutionRequest>> getConfirmedUser(email) async {
    try {
      final snapshot = await tutionReqCollection
          .where('studentEmail', isEqualTo: email)
          .where('statusStudent', isEqualTo: '3')
          .get()
          .onError((error, stackTrace) => null);
      return snapshot.docs.map((doc) {
        print(doc.data());
        return TutionRequest.fromMap(doc.data());
      }).toList();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<TutionRequest>> getPendingedUser(email) async {
    try {
      final snapshot = await tutionReqCollection
          .where('studentEmail', isEqualTo: email)
          .where('statusStudent', isEqualTo: '2')
          .get()
          .onError((error, stackTrace) => null);
      return snapshot.docs.map((doc) {
        print(doc.data());
        return TutionRequest.fromMap(doc.data());
      }).toList();
    } on Exception catch (e) {
      print(e);
    }
  }
}
