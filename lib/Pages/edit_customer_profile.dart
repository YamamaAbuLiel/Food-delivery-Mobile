import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Models/user.dart';
import 'package:untitled/provider/userprovider.dart';

import '../Widgets/custom_text_field_widget.dart';

class EditCustmerProfile extends StatefulWidget {
  const EditCustmerProfile({Key? key}) : super(key: key);

  @override
  State<EditCustmerProfile> createState() => _EditCustmerProfileState();
}



class _EditCustmerProfileState extends State<EditCustmerProfile> {
  @override
  Widget build(BuildContext context) {
    UserModel userData=Provider.of<UserProvider>(context).userModel!;
    TextEditingController fullName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController address = TextEditingController();

    fullName.text=userData.userName;
    email.text=userData.userEmail;
    phone.text=userData.userPhone;
    address.text=userData.userAddress;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(231, 108, 56, 100),
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
            children: [
              CustomTextField(
                controller: fullName,
                prefixIcon: Icons.person,
                labelText: "Full Name",
              ),
              CustomTextField(
                controller: phone,
                prefixIcon: Icons.phone,
                labelText: "Phone",
              ),
              CustomTextField(
                controller: email,
                labelText: "Email",
                prefixIcon: Icons.email,
              ),
              CustomTextField(
                controller: address,
                labelText: "Address",
                prefixIcon: Icons.location_city,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Update",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(231, 108, 56, 100),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
