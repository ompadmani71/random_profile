import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/use_random_model.dart';

class UserApiHelper{

  UserApiHelper._();

  static final UserApiHelper userApiHelper = UserApiHelper._();

  bool isGettingData = true;


  Future<UserDataModel?> getUserData() async {
    isGettingData = true;
    
    http.Response response = await http.get(Uri.parse("https://randomuser.me/api/"));

    if(response.statusCode == 200){

      log(response.body,name: "Response");
      UserDataModel user = userDataModelFromJson(response.body);

      isGettingData = false;

      return user;
    }
    return null;
    
  }
  

}