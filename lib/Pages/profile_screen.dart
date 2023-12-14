import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Models/user.dart';
import 'package:untitled/provider/userprovider.dart';
import '../data_desing.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Provider.of<UserProvider>(context,listen:false).getDetails();
    super.initState();
  }
  Widget build(BuildContext context) {
    UserModel userModel=Provider.of<UserProvider>(context).userModel!;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: const Color.fromRGBO(231, 108, 56, 100),
            centerTitle: true,
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightBlue,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/user-image-default.webp',
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
              ],
            ),
          ),
           Padding(
            padding: EdgeInsets.all(25.0),
            child: Row(
              children: [
                Text(
                  userModel.userName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
           DataDesign("Mobile Number", userModel.userPhone),
           DataDesign("Email", userModel.userEmail),
           DataDesign("Address", userModel.userAddress),
          Center(
            child: SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {
                  // Add your button logic here
                },
                child: const Text("Log Out"),
              ),
            ),
          ),
        ], // Add this comma to fix the issue
      ),
    );
  }
}
