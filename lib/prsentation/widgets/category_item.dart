import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.primaryColor.withOpacity(0.1)
        ),
        child: Icon(Icons.desktop_windows_outlined, 
        size: 40,
        color: AppColors.primaryColor,),
      ),
      Text('Electronics', style: TextStyle(
        fontSize: 18,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor),)
    ],);
  }
}



