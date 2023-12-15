import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/Pages/Auth/register_page.dart';
import 'package:untitled/Pages/profile_screen.dart';
import 'package:untitled/Widgets/custom_text_field_widget.dart';
import 'package:untitled/services/auth.dart';
class LoginPage extends StatefulWidget {
  const LoginPage ({super.key});

  @override
  State<LoginPage> createState() => _State();
}

class _State extends State<LoginPage> {
  //Control and manipulate the text entered into textfields

  TextEditingController emailCon=TextEditingController();
  TextEditingController passwordcon=TextEditingController();
  signin() async{
String response= await AuthMethods().signin(userEmail: emailCon.text, password: passwordcon.text);
try {
  if (response == "Success") {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProfileScreen()), (route) => false);      }
  else {
    showErrorMessage(response);



  }
} on Exception catch (e) {
  print (e);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/images/logo.png" , height: 100 , width:900 ),

            ),
            //appName

            Text("Food Delivery" , style:TextStyle(fontSize: 36 ,fontWeight: FontWeight.bold) ),
            Gap(15),

            CustomTextField(controller: emailCon, prefixIcon: Icons.email, labelText: "Email"),
            CustomTextField(controller: passwordcon, prefixIcon: Icons.password, labelText: "Password"),
            //password
            //loginbut
            Gap(15),
            Row(
              children: [
                Expanded(child: ElevatedButton(onPressed:(){signin();}, child: Text("Log In", style:TextStyle(color:Colors.black)))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              Text("Have Account?"),
              GestureDetector(
                onTap: ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>RegisterPage()), (route) => false),
                  child: Text("Rgister Now",style: TextStyle(color: Colors.blue),))
            ],)

          ],
        ),
      ),

    );
  }
}
