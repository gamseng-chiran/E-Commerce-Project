// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'package:e_commerce/prsentation/state_holders/product_list_by_category_controller.dart';
import 'package:e_commerce/prsentation/widgets/product_card.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    Key? key,
    required this.categoryName,
    required this.categoryId,
  }) : super(key: key);
  final String categoryName;
  final int categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProductListByCategoryController>().getProductList(widget.categoryId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: GetBuilder<ProductListByCategoryController>(
        builder: (productListByCategoryController) {
          if(productListByCategoryController.inProgress){
            return Center(child: CircularProgressIndicator(),);
          }
          return GridView.builder(
            itemCount: productListByCategoryController.productList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: .8
            ), 
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: FittedBox(
                  child: ProductCard(
                    product: productListByCategoryController.productList[index],
                  ),
                ));
            });
        }
      ),
    );
  }
}