import 'dart:convert';

import 'package:e_commerce/data/models/product_model.dart';


class ProductListModel {
  String? msg;
  List<Product>? productList;

 ProductListModel({this.msg, this.productList});

 ProductListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productList = <Product>[];
      json['data'].forEach((v) {
        productList!.add(Product.fromJson(v));
      });
    }
  }
}