class Category {
    int id;
    String categoryName;
    String categoryImg;
    DateTime createdAt;
    DateTime updatedAt;

    Category({
        required this.id,
        required this.categoryName,
        required this.categoryImg,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["categoryName"],
        categoryImg: json["categoryImg"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );
}