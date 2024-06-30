class CreateProfileModel{
  String? cusName;
  int? userId;
  String? cusAdd;
  String? cusCity;
  String? cusState;
  int? cusPostcode;
  int? cusPhone;
  String? cusCounty;
  int? cusFax;
  String? shipName;
  String? shipAdd;
  String? shipCity;
  int? shipPostcode;
  String? shipState;
  String? shipCounty;
  int? shipPhone;
  String? updatedAt;
  String? createdAt;
  String? id;

  CreateProfileModel(
    {
    this.userId,
    this.cusName,
    this.cusAdd,
    this.cusCity,
    this.cusState,
    this.cusPostcode,
     this.cusCounty,
     this.cusPhone,
     this.cusFax,
     this.shipName,
     this.shipAdd,
     this.shipCity,
     this.shipState,
     this.shipPostcode,
     this.shipCounty,
     this.shipPhone,
     this.updatedAt,
     this.createdAt,
     this.id}

  );
  Map<String, dynamic> toJson(){
    return{
      'user_id': userId,
      'cus_name': cusName,
      'cus_add': cusAdd,
      'cus_city': cusCity,
      'cus_state': cusState,
      'cus_postcode': cusPostcode,
      'cus_county': cusCounty,
      'cus_phone': cusPhone,
      'cus_fax': cusFax,
      'ship_name': shipName,
      'ship_add': shipAdd,
      'ship_city': shipCity,
      'ship_state': shipState,
      'ship_postcode': shipPostcode,
      'ship_county': shipCounty,
      'ship_phone': shipPhone,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}