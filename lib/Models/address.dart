class Address {
  final String province;
  final String canton;
  final String district;
  final String details;

  Address({this.province, this.canton, this.district, this.details});
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        province: json['province'],
        canton: json['canton'],
        district: json['district'],
        details: json['details'],
      );

  Map<String, dynamic> toJson() {
    return {
      'province': this.province,
      'canton': this.canton,
      'district': this.district,
      'details': this.details,
    };
  }
}
