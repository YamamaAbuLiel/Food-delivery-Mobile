import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Models/user.dart';
import 'package:untitled/provider/userprovider.dart';
import '../Widgets/data_desing.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getDetails();
    super.initState();
  }

  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserProvider>(context).userModel!;

    // Use MediaQuery to get the screen size
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: const Color.fromRGBO(231, 108, 56, 100),
            centerTitle: true,
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
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
            padding: EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userModel.userName,
                  style: TextStyle(
                    fontSize: screenWidth > 750 ? 24 : 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          DataDesign("Mobile Number", userModel.userPhone),
          DataDesign("Email", userModel.userEmail),
          DataDesign("Address", userModel.userAddress),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth > 750 ? 16 : 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth > 750 ? 16 : 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
