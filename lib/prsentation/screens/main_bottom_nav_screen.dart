import 'package:e_commerce/prsentation/screens/cart_screen.dart';
import 'package:e_commerce/prsentation/screens/catergories_screen.dart';
import 'package:e_commerce/prsentation/screens/gift_screen.dart';
import 'package:e_commerce/prsentation/screens/home_screen.dart';
import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottonNavScreenState();
}

class _MainBottonNavScreenState extends State<MainBottomNavScreen> {
  int _currentSelectedIndex = 0;
  final List<Widget> _screens =[
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    GiftScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentSelectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index){
        _currentSelectedIndex = index;
        if(mounted){
          setState(() {
            
          });
        }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categoris"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_rounded),label: "Gift")
        ],
      ),
    );
  }
}