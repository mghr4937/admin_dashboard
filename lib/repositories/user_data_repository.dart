import 'package:cloud_firestore/cloud_firestore.dart';

import '/models/user_data.dart';

class UserDataRepository {
  // 1
  final CollectionReference collection = FirebaseFirestore.instance.collection('users');
  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return collection.doc(id).get();
  }

  // 3
  Future<DocumentReference> addUser(UserData userData) {
    return collection.add(userData.toJson());
  }

  Future<UserData> getUserByEmail(String email) async {
    return collection.where('email', isEqualTo: email).get().then((value) {
      var results = value.docs.map((e) => UserData.fromMap(e.data() as Map<String, dynamic>)).toList();
      return results[0];
    });
  }

  // 4
  void updateUser(UserData userData) async {
    await collection.doc(userData.uid).update(userData.toMap());
  }

  // 5
  void deleteUser(UserData user) async {
    await collection.doc(user.uid).delete();
  }
}
