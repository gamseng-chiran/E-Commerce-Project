import 'package:e_commerce/prsentation/screens/main_bottom_nav_screen.dart';
import 'package:e_commerce/prsentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  TextEditingController _FNController = TextEditingController();
  TextEditingController _LNController = TextEditingController();
  TextEditingController _MobileController = TextEditingController();
  TextEditingController _CityController = TextEditingController();
  TextEditingController _AddressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                SizedBox(height: 24,),
                AppLogo(),
                SizedBox(height: 16,),
                Text('Complete Profile', style: textTheme.headlineLarge,),
                SizedBox(height: 4,),
                Text('Get started with us with your details', style: textTheme.headlineSmall,),
                SizedBox(height: 24,),
                _buildCompleteProfileForm(),
                SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () {
                    Get.to(()=>MainBottomNavScreen());
                }, child: Text('Complete'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteProfileForm() {
    return Form(
      key: _formKey,
      child: Column(
                    children: [
                      TextFormField(
                        controller: _FNController,
                        decoration: InputDecoration(
                          hintText: 'First name',
                        ),
                      ),
                      SizedBox(height: 8,),
                      TextFormField(
                        controller: _LNController,
                        decoration: InputDecoration(
                          hintText: 'Last name',
                        ),
                      ),
                      SizedBox(height: 8,),
                      TextFormField(
                        controller: _MobileController,
                        decoration: InputDecoration(
                          hintText: 'Mobile',
                        ),
                      ),
                      SizedBox(height: 8,),
                      TextFormField(
                        controller: _CityController,
                        decoration: InputDecoration(
                          hintText: 'City',
                        ),
                      ),
                      SizedBox(height: 8,),
                      TextFormField(
                        controller: _AddressController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Shipping address',
                        ),
                      ),
                    ],
                  ),
    );
  }
  @override
  void dispose() {
    _FNController.dispose();
    _LNController.dispose();
    _MobileController.dispose();
    _CityController.dispose();
    _AddressController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
