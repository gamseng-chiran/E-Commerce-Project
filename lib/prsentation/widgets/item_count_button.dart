import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ItemCountButton extends StatefulWidget {
  final int minValue;
  final int initialValue;
  final Function(int) onChanged;

  const ItemCountButton({
    Key? key,
    this.minValue = 1,
    this.initialValue = 1,
    required this.onChanged,
  }) : super(key: key);

  @override
  _ItemCountButtonState createState() => _ItemCountButtonState();
}

class _ItemCountButtonState extends State<ItemCountButton> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.initialValue;
  }

  void _incrementCount() {
    setState(() {
      _count++;
    });
    widget.onChanged(_count);
  }

  void _decrementCount() {
    if (_count > widget.minValue) {
      setState(() {
        _count--;
      });
      widget.onChanged(_count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          elevation: 4,
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
          child: IconButton(
            
            icon: Icon(Icons.remove),
            onPressed: _decrementCount,
          ),
        ),
        Text(
          '$_count',
          style: TextStyle(fontSize: 16),
        ),
        Material(
        elevation: 4,
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: _incrementCount,
          ),
        ),
      ],
    );
  }
}

// class ItemCountButton extends StatefulWidget {
//   final int minValue;
//   final int initialValue;
//   final Function(int) onChanged;

//   const ItemCountButton({
//     Key? key,
//     this.minValue = 1,
//     this.initialValue = 1,
//     required this.onChanged,
//   }) : super(key: key);

//   @override
//   _ItemCountButtonState createState() => _ItemCountButtonState();
// }

// class _ItemCountButtonState extends State<ItemCountButton> {
//   late int _count;

//   @override
//   void initState() {
//     super.initState();
//     _count = widget.initialValue;
//   }

//   void _incrementCount() {
//     setState(() {
//       _count++;
//     });
//     widget.onChanged(_count);
//   }

//   void _decrementCount() {
//     if (_count > widget.minValue) {
//       setState(() {
//         _count--;
//       });
//       widget.onChanged(_count);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Material(
//           elevation: 4,
//           color: AppColors.primaryColor,
//           borderRadius: BorderRadius.circular(16),
//           child: IconButton(
//             icon: Icon(Icons.remove),
//             onPressed: _decrementCount,
//           ),
//         ),
//         Text(
//           '$_count',
//           style: TextStyle(fontSize: 16),
//         ),
//         Material(
//           elevation: 4,
//           color: AppColors.primaryColor,
//           borderRadius: BorderRadius.circular(16),
//           child: IconButton(
//             icon: Icon(Icons.add),
//             onPressed: _incrementCount,
//           ),
//         ),
//       ],
//     );
//   }
// }