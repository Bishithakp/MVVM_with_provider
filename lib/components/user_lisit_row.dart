import 'package:appdevelop/models/user_model.dart';
import 'package:flutter/material.dart';

import 'app_title.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  //final Function onTap;
  const UserListRow({super.key,required this.userModel, });

  @override
  Widget build(BuildContext context) {
    return Container(
               // child: InkWell(
                 // onTap: onTap(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTitle(text: userModel.name!,),
                      Text(
                        userModel.email!,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              
  }
}