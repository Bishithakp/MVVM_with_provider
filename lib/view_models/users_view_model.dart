import 'dart:js_util';

import 'package:appdevelop/models/user_model.dart';
import 'package:appdevelop/repo/api_status.dart';
import 'package:appdevelop/repo/users_services.dart';
import 'package:flutter/material.dart';

import '../models/user_error.dart';

class UsersViewmodel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _usersListModel = [];
  UserError _userError=UserError(code: 0, message: "No Error");

  bool get loading => _loading;
  List<UserModel> get usersListModel => _usersListModel;
  UserError get userError => _userError;
  UsersViewmodel() {
    
    getUsers();

  }

  setLoading(bool loadingStatus) async {
    _loading = loadingStatus;
    notifyListeners();
  }

  setUserListModel(List<UserModel> usersListModel) async {
    _usersListModel = usersListModel;

    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);
 
    var res = await UserSevices.getUsers();

    if (res is Success) {
     
      setUserListModel(res.response as List<UserModel>);
    }
    if (res is Failure) {
  
      UserError userError = UserError(
          code: res.code, message: res.errorresponse.toString());
      setUserError(userError);
    }  
    setLoading(false);
  }
}
