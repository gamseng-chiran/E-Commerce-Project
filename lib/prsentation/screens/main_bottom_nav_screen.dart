import 'package:e_commerce/prsentation/screens/cart_list_screen.dart';
import 'package:e_commerce/prsentation/screens/catergory_list_screen.dart';
import 'package:e_commerce/prsentation/screens/home_screen.dart';
import 'package:e_commerce/prsentation/screens/wish_list-screen.dart';
import 'package:e_commerce/prsentation/state_holders/category_list_controller.dart';
import 'package:e_commerce/prsentation/state_holders/home_slider_controller.dart';
import 'package:e_commerce/prsentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:e_commerce/prsentation/state_holders/new_product_list_controller.dart';
import 'package:e_commerce/prsentation/state_holders/popular_product_list_controller.dart.dart';
import 'package:e_commerce/prsentation/state_holders/special_product_list_controller.dart';
import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottonNavScreenState();
}

class _MainBottonNavScreenState extends State<MainBottomNavScreen> {
  final MainBottomNavBarController _navBarController = Get.find<MainBottomNavBarController>();
  final List<Widget> _screens =[
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<HomeSliderController>().getSliders();
    Get.find<CategoryListController>().getCategoryList();
    Get.find<PopularProductListController>().getPopularProductList();
    Get.find<NewProductListController>().getNewProductList();
    Get.find<SpecialProductListController>().getSpecialProductList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (_) {
          return _screens[_navBarController.selectedIndex];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navBarController.selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index){
        _navBarController.changeIndex(index);
        if(mounted){
          setState(() {
            
          });
        }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "Categoris"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded),label: "Wishlist")
        ],
      ),
    );
  }
}