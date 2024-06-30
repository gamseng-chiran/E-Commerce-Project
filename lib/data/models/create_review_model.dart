class ReviewModel{
  // final String firstName;
  // final String lastName;
  // final String review;

  // ReviewModel({
  //   required this.firstName,
  //   required this.lastName,
  //   required this.review,
  // });

  // factory ReviewModel.fromJson(Map<String, dynamic> json) {
  //   return ReviewModel(
  //     firstName: json['firstName'],
  //     lastName: json['lastName'],
  //     review: json['review'],
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'firstName': firstName,
  //     'lastName': lastName,
  //     'review': review,
  //   };
  // }
  String? id;
  String? firstName;
  String? lastName;
  String? review;
  String? productId;

  ReviewModel({this.id, this.firstName, this.lastName, this.review, this.productId});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      review: json['review'],
      productId: json['product_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'review': review,
      'product_id': productId,
    };
  }
}