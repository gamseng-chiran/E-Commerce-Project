// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/data/models/category.dart';
import 'package:e_commerce/prsentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:e_commerce/prsentation/screens/product_list_screen.dart';
import 'package:e_commerce/prsentation/utility/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=>ProductListScreen(categoryName: category.categoryName ?? '', categoryId: category.id!,));
      },
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primaryColor.withOpacity(0.1)
          ),
          child: NetworkImageWidget(
            url: category.categoryImg ?? '',
            height: 30,
            width: 30,)
        ),
        Text(category.categoryName, 
        maxLines: 2,
        style: TextStyle(
          fontSize: 18,
          letterSpacing: 0.4,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor,
          overflow: TextOverflow.ellipsis,
          ),)
      ],),
    );
  }
}



