// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/prsentation/widgets/category_item.dart';
import 'package:e_commerce/prsentation/widgets/product_card.dart';
import 'package:e_commerce/prsentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:e_commerce/prsentation/utility/assets_path.dart';
import 'package:e_commerce/prsentation/widgets/app_bar_icon_button.dart';
import 'package:e_commerce/prsentation/widgets/home_carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(
                height: 16,
              ),
              HomeCarouselSlider(),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'All category',
                onTapSeeAll: () {
                  
                },
              ),
              SizedBox(height: 10,),
              _buildCategoryListView(),
              SizedBox(height: 8,),
              SectionHeader(
                title: 'Popular products',
                onTapSeeAll: () {
                },
              ),
              _buildProductListView(),
              SizedBox(height: 8,),
              SectionHeader(
                title: 'Special',
                onTapSeeAll: () {
                },
              ),
              _buildProductListView(),
              SizedBox(height: 8,),
              SectionHeader(
                title: 'New',
                onTapSeeAll: () {
                },
              ),
              _buildProductListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView() {
    return SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index){
                return CategoryItem();
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 16,);
              },
              ),
            );
  }
  Widget _buildProductListView() {
    return SizedBox(
              height: 235,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index){
                return ProductCard();
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 8,);
              },
              ),
            );
  }

  Widget _buildSearchTextField() {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'search',
          filled: true,
          fillColor: Colors.grey.shade200,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8))),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appNavLogoSvg),
      actions: [
        AppBarIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
        SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.notifications,
          onTap: () {},
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }
}

