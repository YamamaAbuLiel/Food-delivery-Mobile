import 'package:flutter/cupertino.dart';
import 'package:untitled/Models/user.dart';
import 'package:untitled/services/auth.dart';

class UserProvider with ChangeNotifier {
  UserModel ?userModel;
  bool isLoad =true;
  getDetails()async{
    userModel= await AuthMethods().getUserDetails();
    isLoad=false;
    notifyListeners();
  }
}