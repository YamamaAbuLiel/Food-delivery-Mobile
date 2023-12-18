import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Models/user.dart';
import 'package:untitled/Pages/Auth/log_in.dart';
import 'package:untitled/Pages/edit_customer_profile.dart';
import 'package:untitled/provider/userprovider.dart';
import 'package:untitled/services/auth.dart';
import '../Widgets/app_bar_widget.dart';
import '../Widgets/custom_tab_bar_widget.dart';
import '../Widgets/data_desing.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = Provider.of<UserProvider>(context).userModel;

    if (userModel == null) {
      return Scaffold(
        appBar: Custom_AppBar(head: ('Profile'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You are not logged in. Please log in.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(Size(250, 60),),
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(231, 108, 56, 1.0))
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Log In',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }


    return Scaffold(
      appBar: Custom_AppBar(head: "Profile"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

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
              padding: const EdgeInsets.only(top: 25.0, left: 25.0),
              child: Row(
                children: [
                  Text(
                    userModel.userName ?? '',
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
                      onPressed: () {
                        logout();
                      },
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
