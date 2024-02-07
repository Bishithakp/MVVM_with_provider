
import 'package:appdevelop/models/user_error.dart';
import 'package:appdevelop/models/user_model.dart';
import 'package:appdevelop/view_models/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_loading.dart';
import '../components/user_lisit_row.dart';
import 'add_user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UsersViewmodel>(builder: (_, mod, __) {
      
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("users"),
          actions: [IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>AddUserScreen()));
          }, icon: const Icon(Icons.add))],
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
            mod.loading
                  ? const Apploading()
                  :   mod.userError.code != 0 
                      ? Text(  mod.userError.message)
                      : Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                             
                              
                                return UserListRow(
                                  userModel: mod.usersList[index],
                                  
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount:   mod.usersList.length))
            ],
          ),
        ),
      );
    });
  }
}
