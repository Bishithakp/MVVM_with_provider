import 'package:appdevelop/components/app_loading.dart';
import 'package:appdevelop/components/app_title.dart';
import 'package:appdevelop/components/user_lisit_row.dart';
import 'package:appdevelop/models/user_error.dart';
import 'package:appdevelop/models/user_model.dart';
import 'package:appdevelop/view_models/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UsersViewmodel>(builder: (_, usersViewmodel, __) {
      
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("users"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              usersViewmodel.loading
                  ? Apploading()
                  : usersViewmodel.userError.code != 0
                      ? Text(usersViewmodel.userError.message)
                      : Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                UserModel userModel =
                                    usersViewmodel.usersListModel[index];
                                
                                return UserListRow(
                                  userModel: userModel,
                                  // onTap: () async {}
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              itemCount: usersViewmodel.usersListModel.length))
            ],
          ),
        ),
      );
    });
  }
}
