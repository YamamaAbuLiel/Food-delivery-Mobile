import 'package:flutter/cupertino.dart';
import 'package:untitled/Models/user.dart';
import 'package:untitled/services/auth.dart';

class UserProvider with ChangeNotifier {
  //Nu variable to hold the user data
  UserModel ?userModel;
  bool isLoad =true;

  getDetails()async{
    userModel= await AuthMethods().getUserDetails();
    isLoad=false;
    notifyListeners();
  }
}