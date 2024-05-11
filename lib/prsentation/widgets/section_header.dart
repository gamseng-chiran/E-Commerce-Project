import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  
  const SectionHeader({
    Key? key,
    required this.title,
    required this.onTapSeeAll,
  }) : super(key: key);
  final String title;
  final VoidCallback onTapSeeAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
      TextButton(onPressed: onTapSeeAll, child: Text('See all', 
      style: TextStyle(fontSize: 16),),)
    ],);
  }
}