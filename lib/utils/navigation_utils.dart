import 'package:appdevelop/screens/users_details.dart';
import 'package:flutter/material.dart';

void OpenUserDetails(context,index) async{
  Navigator.push(context,MaterialPageRoute(builder: (context)=>UserDetailsScreen()));
}