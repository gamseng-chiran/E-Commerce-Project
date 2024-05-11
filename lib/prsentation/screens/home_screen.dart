// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:html';

import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:e_commerce/prsentation/widgets/category_item.dart';
import 'package:e_commerce/prsentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

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
              ProductCard()
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

  Widget _buildSearchTextField() {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'search',
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

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Container(
              width: 150,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsPath.productDummyImgJpeg),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nike sport shoe special edition',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500
                ),),
                Wrap(
                  spacing: 10,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text('\$30', style: 
                    TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor
                    ),),
                    Wrap(
                      spacing: 10,
                      children: [
                        Icon(Icons.star, color: Colors.amber,size: 20,),
                        Text('3.8'),
                        Card(
                          color: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(Icons.favorite_outline, size: 16, color: Colors.white,),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

