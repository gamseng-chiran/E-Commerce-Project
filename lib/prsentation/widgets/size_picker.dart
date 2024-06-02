// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
   SizePicker({
    Key? key,
    required this.sizes,
    required this.onChanged,
     this.isRounded = true
  }) : super(key: key);
  final List<String> sizes;
  final Function(String) onChanged;
  final bool isRounded;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.sizes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selectedIndex = index;
                widget.onChanged(widget.sizes[index]);
                setState(() {});
              },
              child: Container(
                margin: EdgeInsets.only(right: 8),
                height: 40,
                width: widget.isRounded ? 40: null,
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _getSelectedBackgroundColor(index==selectedIndex),
                  borderRadius: BorderRadius.circular(
                    widget.isRounded ? 100: 8,
                  ),
                  border: Border.all(color: _getSelectedTextColor(index==selectedIndex))
                ),
                child: FittedBox(
                  child: Text(
                    widget.sizes[index],
                    style: TextStyle(
                      color: _getSelectedTextColor(index==selectedIndex)
                    ),
                  ),
                )
              ),
            );
          }),
    );
  }
  Color _getSelectedTextColor(bool isSelected){
    return isSelected? Colors.white: Colors.black;
  }
  Color _getSelectedBackgroundColor(bool isSelected){
    return isSelected? AppColors.primaryColor:Colors.transparent;
  }
}