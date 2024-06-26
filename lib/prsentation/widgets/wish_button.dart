// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:e_commerce/prsentation/utility/app_colors.dart';

class WishButton extends StatelessWidget {
  final bool showAddToWishList;
  final bool isSelected;
  final VoidCallback onTap;
  const WishButton({
    Key? key,
    this.showAddToWishList = true,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showAddToWishList,
      replacement: _getIconButton(Icons.delete_outline),
      child: InkWell(
        onTap: onTap,
        child: _getIconButton(_getIconData()))
    );
  }

  Widget _getIconButton (IconData icon){
    return Card(
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Icon(
          icon,
          size: 16,
          color: Colors.white,
        ),
      );
  }
  IconData _getIconData (){
    return isSelected ? Icons.favorite : Icons.favorite_outline_rounded;
  }
}
