import 'package:appdevelop/models/user_model.dart';
import 'package:flutter/material.dart';

import '../screens/users_details.dart';
import 'app_title.dart';

class UserListRow extends StatelessWidget {
final UserModel userModel;

  //final Function onTap;
  const UserListRow({
    super.key,
    required this.userModel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: () {
        Navigator.push(
             context,
            MaterialPageRoute(
              builder: (context) => UserDetailsScreen(
              userModel: userModel

               
              )
            ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            text: userModel.name!,
          ),
          textData(label:userModel.email!, ),
          textData(label: userModel.address.city),
     
        ],
      ),
    ));
  }

  Text textData({ required String label, }) {
    return Text(
        label,
          style: TextStyle(color: Colors.red,),
        );
  }
}
