class ProfileModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? state;
  String? postcode;
  String? country;
  String? createdAt;
  String? updatedAt;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.createdAt,
    this.updatedAt,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'postcode': postcode,
      'country': country,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
