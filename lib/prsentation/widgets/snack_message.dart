import 'package:flutter/material.dart';

void ShowSnackMessage (BuildContext context, String message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),),);
}