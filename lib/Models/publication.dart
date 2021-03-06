import 'package:programathon_tuercas_2020/Models/address.dart';
import 'package:programathon_tuercas_2020/Models/user_profile.dart';
import 'package:programathon_tuercas_2020/repositories/DB/publication_repository.dart';

class Publication {
  final String id;
  final String title;
  final String description;
  final double price;
  final int quotas;
  final List<String> extras;
  final List<String> photos;
  final DateTime datePublication;
  final Address address;
  final UserProfile userProfile;

  Publication(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.quotas,
      this.extras,
      this.photos,
      this.datePublication,
      this.address,
      this.userProfile});
  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      quotas: json['quotas'],
      extras: List<String>.from(json['extras'].map((x) => x)),
      photos: List<String>.from(json['photos'].map((x) => x)),
      datePublication: json['datePublication'].toDate(),
      // DateTime.fromMillisecondsSinceEpoch(json['datePublication'] * 1000),
      address: Address.fromJson(json['address']),
      userProfile: UserProfile.fromJson(json['userProfile']));

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'price': this.price,
      'quotas': this.quotas,
      'extras': this.extras,
      'photos': this.photos,
      'datePublication': this.datePublication,
      'address': this.address.toJson(),
      'userProfile': this.userProfile.toJson()
    };
  }

  Future<List<String>> getImages() async {
    PublicatonRepository _repo = new PublicatonRepository();
    final list = await _repo.loadImage(this.photos);
    return list;
  }
}
