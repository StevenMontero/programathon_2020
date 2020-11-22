import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:programathon_tuercas_2020/Models/user_profile.dart';

class UserRepository {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('users');

  Future<void> addNewUser(UserProfile user) {
    return _ref
        .doc(user.id)
        .set(user.toJson(), SetOptions(merge: true))
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to add user: $error'));
  }

  Future<UserProfile> getUserProfile(String idUser) async {
    UserProfile user;
    DocumentSnapshot snapshot;
    snapshot = await _ref.doc(idUser).get();
    if (snapshot.exists) {
      return user = UserProfile.fromJson(snapshot.data());
    } else {
      return null;
    }
  }

  Future<void> updateUser(
    UserProfile user,
  ) {
    return _ref
        .doc(user.id)
        .update(user.toJson())
        .then((value) => print('Success Update'))
        .catchError((error) => print('Failure Update'));
  }
}
