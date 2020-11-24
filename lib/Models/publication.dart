import 'package:programathon_tuercas_2020/Models/address.dart';
import 'package:programathon_tuercas_2020/Models/user_profile.dart';

class Publication {
  final String id;
  final String title;
  final String description;
  final double price;
  final int quotas;
  final String otherDetails;
  final List<String> photos;
  final List<DateTime> schedule;
  final Address address;
  final UserProfile userProfile;

  Publication(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.quotas,
      this.otherDetails,
      this.photos,
      this.schedule,
      this.address,
      this.userProfile});
  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: double.parse(json['price']),
      quotas: int.parse(json['quotas']),
      otherDetails: json['otherDetails'],
      photos: List<String>.from(json['photos'].map((x) => x)),
      schedule: List<DateTime>.from(json['schedule'].map((x) => x)),
      address: json['address'],
      userProfile: UserProfile.fromJson(json['userProfile']));

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'price': this.price,
      'quotas': this.quotas,
      'otherDetails': this.otherDetails,
      'photos': this.photos,
      'schedule': this.schedule,
      'address': this.address,
      'userProfile': this.userProfile.toJson()
    };
  }
}
