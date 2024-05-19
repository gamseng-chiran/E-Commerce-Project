class SliderData {
    int id;
    String title;
    String shortDes;
    String price;
    String image;
    int productId;
    DateTime createdAt;
    DateTime updatedAt;

    SliderData({
        required this.id,
        required this.title,
        required this.shortDes,
        required this.price,
        required this.image,
        required this.productId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory SliderData.fromJson(Map<String, dynamic> json) => SliderData(
        id: json["id"],
        title: json["title"],
        shortDes: json["short_des"],
        price: json["price"],
        image: json["image"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "short_des": shortDes,
        "price": price,
        "image": image,
        "product_id": productId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
