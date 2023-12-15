import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Models/user.dart';
import 'package:untitled/Pages/edit_customer_profile.dart';
import 'package:untitled/provider/userprovider.dart';
import '../Widgets/data_desing.dart';
import '../services/auth.dart';
import 'Auth/log_in.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  logout() async {
    try {
      await AuthMethods().signout();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false,
      );
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getDetails();
    super.initState();
  }

  Widget build(BuildContext context) {
    UserModel? userModel = Provider
        .of<UserProvider>(context)
        .userModel;

    if (userModel == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: const Color.fromRGBO(231, 108, 56, 100),
              centerTitle: true,
              title: const Text(
                "Profile",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightBlue,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/user-image-default.webp',
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:25.0,left: 25.0),
              child: Row(
                children: [
                  Text(
                    userModel.userName ?? '',
                    // Use ?? to provide a default value if userModel.userName is null
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            DataDesign("Mobile Number", userModel.userPhone ?? ''),
            DataDesign("Email", userModel.userEmail ?? ''),
            DataDesign("Address", userModel.userAddress ?? ''),

            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {logout();},
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditCustmerProfile(),
                          ),
                        );
                      },
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.yellow),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
