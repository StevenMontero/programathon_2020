import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:programathon_tuercas_2020/Models/publication.dart';

class PublicatonRepository {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('users');
  FirebaseStorage _storageRef = FirebaseStorage.instance;
  Future<void> addNewPublication(Publication publication) {
    return _ref
        .doc(publication.id)
        .set(publication.toJson(), SetOptions(merge: true))
        .then((value) => print('Publication Added'))
        .catchError((error) => print('Failed to add publication: $error'));
  }

  Future<Publication> getUserProfile(String idPublication) async {
    Publication publication;
    DocumentSnapshot snapshot;
    snapshot = await _ref.doc(idPublication).get();
    if (snapshot.exists) {
      return publication = Publication.fromJson(snapshot.data());
    } else {
      return null;
    }
  }

  Future<void> updateUser(
    Publication publication,
  ) {
    return _ref
        .doc(publication.id)
        .update(publication.toJson())
        .then((value) => print('Success Update'))
        .catchError((error) => print('Failure Update'));
  }

  Future<void> uploadFile(String filePath) async {
    // File file = File(filePath);

    try {
      // await _storageRef.ref('uploads/file-to-upload.png').putFile(file);
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }
}
