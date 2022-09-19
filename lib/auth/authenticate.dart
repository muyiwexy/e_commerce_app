import 'package:e_commerce_app/data/userdata.dart';
import 'package:e_commerce_app/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:e_commerce_app/constants/app_constants.dart';

class Authenticate extends ChangeNotifier {
  Client client = Client();
  Account ? account;
  late bool  _isLoggedin;
  User ? _user;
  String ? _error;


  bool get isLoggedin => _isLoggedin;
  User? get user => _user;
  String? get error => _error;

  Authenticate() {
    _init();
  }
  _init() {
    _isLoggedin = false;
    _user = null;
    client
        .setEndpoint(Appconstants.endpoint)
        .setProject(Appconstants.projectid);
    account = Account(client);
    _checkisLoggedin();
  }

  _checkisLoggedin() async{
    try{
      _user = await _getaccount();
      _isLoggedin = true;
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

  Future<User?>_getaccount() async{
    try {
      final res = await account?.get();
      if(res!.status == 200){
        final result = res as Response<dynamic>;
        return User.fromJson(result.data);
      }else{
        return null;
      }
    } catch (e) {
      throw(e);
    }
  }

  // Future<LoadUser?>_getaccount() async{
  //   try {
  //     Response <String, dynamic> res = await account.get();
  //     if(res.runtimeType == true){
  //       return LoadUser.fromJson(res.data);
  //     }else{
  //       return null;
  //     }
  //   } catch (e) {
  //     throw(e);
  //   }
  // }
  login(String email, String password) async {
    try {
      var result =
          await account!.createEmailSession(email: email, password: password);
      print(result);
    } catch (e) {
      print(e);
    }
  }

  signup(String name, String email, String password) async {
    try {
      var result = await account!.create(
          userId: 'unique()', name: name, email: email, password: password);
      print(result.$id);
    } catch (e) {
      print(e);
    }
  }
}
