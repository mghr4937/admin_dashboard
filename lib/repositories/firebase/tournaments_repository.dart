import 'package:cloud_firestore/cloud_firestore.dart';

const String _collection = 'tournaments';
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection(_collection);

class TournamentsRepository {
  static String? userUid;

  static Future<void> addItem({
    required String name,
    required int size,
    required bool isActive,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection(_collection).doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "description": size,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String title,
    required String description,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection(_collection).doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }
}
