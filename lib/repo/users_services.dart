import 'dart:io';

import 'package:appdevelop/models/user_model.dart';
import 'package:appdevelop/repo/api_status.dart';
import 'package:appdevelop/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserSevices {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USERLISTS);
      var response = await http.get(url);
   
      if (200 == response.statusCode) {
        return 
         Success(response: userModelFromJson(response.body), code: 200);
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorresponse: 'invalid Response');
    }
     on HttpException {
      return Failure(code: NO_INTERNET, errorresponse: 'NO internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorresponse: 'Invalid Format');
    }
     catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorresponse:e.toString());
    }
  }
}
