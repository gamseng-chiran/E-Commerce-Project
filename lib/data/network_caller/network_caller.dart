import 'dart:convert';

import 'package:e_commerce/app.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/prsentation/screens/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkCaller{
  static Future<NetworkResponse> getRequest({required String url}) async{
    try{
      final Response response =await get(Uri.parse(url));
      if(response.statusCode==200){
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(responseCode: response.statusCode, 
        isSuccess: true,
        responseData: decodeData);
      }else if(response.statusCode==401){
        _goToSignInScreen();
        return NetworkResponse(responseCode: response.statusCode, 
        isSuccess: false);
      }
      else{
        return NetworkResponse(responseCode: response.statusCode,
         isSuccess: false);
      }
    }catch (e){
      return NetworkResponse(responseCode: -1, 
      isSuccess: false,
      errorMessage: e.toString());
    }
  }
  static _goToSignInScreen(){
    Navigator.push(CraftyBay.navigationKey.currentState!.context, 
    MaterialPageRoute(builder: (context) => EmailVerificationScreen()));
  }
}