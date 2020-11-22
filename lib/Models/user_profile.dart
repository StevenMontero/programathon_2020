class UserProfile {
  String id;
  String userName;
  String email;
  String photoUri;
  String address;
  String phone;

  UserProfile({this.id, this.userName, this.email, this.photoUri, this.phone});

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      photoUri: json['photoUri'],
      phone: json['phone']);

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'userName': this.userName,
      'email': this.email,
      'photoUri': this.photoUri,
      'address': this.address,
      'phone': this.phone
    };
  }
}
