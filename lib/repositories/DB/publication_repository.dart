import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:programathon_tuercas_2020/Models/publication.dart';

class PublicatonRepository {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('publicaciones');
  FirebaseStorage _storageRef = FirebaseStorage.instance;
  Future<void> addNewPublication(Publication publication) {
    return _ref
        .doc(publication.id)
        .set(publication.toJson(), SetOptions(merge: true))
        .then((value) => print('Publication Added'))
        .catchError((error) => print('Failed to add publication: $error'));
  }

  Future<List<Publication>> getListPublications() async {
    List<Publication> publication = new List();
    QuerySnapshot snapshot = await _ref.get();
    snapshot.docs.forEach((element) {
      publication.add(Publication.fromJson(element.data()));
    });
    print(publication);
    return publication;
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

  Future<void> uploadFile(List<Asset> images) async {
    for (var imageFile in images) {
      try {
        await _storageRef
            .ref('imagenes/' + '${imageFile.name}')
            .putData((await imageFile.getByteData()).buffer.asUint8List());
      } on FirebaseException catch (e) {
        print('Error subir foto :' + e.message);
      }
    }
  }
}
