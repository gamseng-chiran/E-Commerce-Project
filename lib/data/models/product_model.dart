import 'package:e_commerce/data/models/brand.dart';
import 'package:e_commerce/data/models/category.dart';

// class Product {
//     int id;
//     Title title;
//     ShortDes shortDes;
//     String price;
//     int discount;
//     String discountPrice;
//     String image;
//     int stock;
//     int star;
//     Remark remark;
//     int categoryId;
//     int brandId;
//     DateTime createdAt;
//     DateTime updatedAt;
//     Brand brand;
//     Category category;

//     Product({
//         required this.id,
//         required this.title,
//         required this.shortDes,
//         required this.price,
//         required this.discount,
//         required this.discountPrice,
//         required this.image,
//         required this.stock,
//         required this.star,
//         required this.remark,
//         required this.categoryId,
//         required this.brandId,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.brand,
//         required this.category,
//     });

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         title: titleValues.map[json["title"]]!,
//         shortDes: shortDesValues.map[json["short_des"]]!,
//         price: json["price"],
//         discount: json["discount"],
//         discountPrice: json["discount_price"],
//         image: json["image"],
//         stock: json["stock"],
//         star: json["star"],
//         remark: remarkValues.map[json["remark"]]!,
//         categoryId: json["category_id"],
//         brandId: json["brand_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         brand: Brand.fromJson(json["brand"]),
//         category: Category.fromJson(json["category"]),
//     );
// }
class Product {
  int? id;
  String? title;
  String? shortDes;
  String? price;
  int? discount;
  String? discountPrice;
  String? image;
  int? stock;
  int? star;
  String? remark;
  int? categoryId;
  int? brandId;
  String? createdAt;
  String? updatedAt;
  Brand? brand;
  Category? category;

  Product(
      {this.id,
      this.title,
      this.shortDes,
      this.price,
      this.discount,
      this.discountPrice,
      this.image,
      this.stock,
      this.star,
      this.remark,
      this.categoryId,
      this.brandId,
      this.createdAt,
      this.updatedAt,
      this.brand,
      this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    image = json['image'];
    stock = json['stock'];
    star = json['star'];
    remark = json['remark'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
  }
}