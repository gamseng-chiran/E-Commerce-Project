// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartModel {
  final int productId;
final String size;
final String color;
final int quantity;
  CartModel({
    required this.productId,
    required this.size,
    required this.color,
    required this.quantity,
  });
  Map<String , dynamic> toJson (){
    return {
      'product_id': productId,
      'color' : color,
      'size' : size,
      'qty' : quantity
    };
  }

}



