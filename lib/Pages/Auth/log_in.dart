import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/Pages/Auth/register_page.dart';
import 'package:untitled/Widgets/custom_tab_bar_widget.dart';
import 'package:untitled/Widgets/custom_text_field_widget.dart';
import 'package:untitled/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();

  void signin() async {
    String response = await AuthMethods().signin(
      userEmail: emailCon.text,
      password: passwordCon.text,
    );
    try {
      if (response == "Success") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CustomTabBar()),
              (route) => false,
        );
      } else {
        showErrorMessage(response);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _handleForgotPassword() async {
    String email = emailCon.text;

    if (email.isNotEmpty) {
      String resetResult = await AuthMethods().resetPassword(userEmail: email);
      showErrorMessage(resetResult);
    } else {
      showErrorMessage("Enter your email address");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: 100,
                width: 900,
              ),
            ),
            Text(
              "Food Delivery",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Gap(15),
            CustomTextField(
              controller: emailCon,
              prefixIcon: Icons.email,
              labelText: "Email",
            ),
            CustomTextField(
              controller: passwordCon,
              prefixIcon: Icons.password,
              labelText: "Password",
            ),
            Gap(15),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      signin();
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have an account?"),
                GestureDetector(
                  onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                        (route) => false,
                  ),
                  child: Text(
                    "Register Now",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _handleForgotPassword,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
