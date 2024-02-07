import 'package:appdevelop/models/user_model.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserModel userModel;
  const UserDetailsScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.height / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailsScreen(
              label: 'Name:',
              text: userModel.name!,
            ),
            detailsScreen(label: 'Address:', 
            text: userModel.address!.city),
            detailsScreen(text: userModel.company!.name!, label: 'Company:'),
            detailsScreen(text: userModel.phone!, label: 'PHone:'),
            detailsScreen(text: userModel.username!, label: 'UserName:'),
            detailsScreen(text: userModel.website!, label: 'Website:')
          ],
        ),
      ),
    );
  }

  Row detailsScreen({required String text, required String label}) {
    return Row(children: [
      Text(
        label,
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
      Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.blue),
      )
    ]);
  }
}
