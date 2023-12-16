import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/Pages/Auth/log_in.dart';
import 'package:untitled/Pages/main_page.dart';
import 'package:untitled/Widgets/custom_text_field_widget.dart';
import 'package:untitled/services/auth.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

//Control and manipulate the text entered into textfields
  TextEditingController fullName=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController address=TextEditingController();

  register() async {
    try {



      String response = await AuthMethods().signup(
        userName: fullName.text,
        userEmail: email.text,
        userPhone: phone.text,
        password: password.text,
        userAddress:address.text,
      );

      if (response == "Success") {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);      } else {
        // Show the error message in the application
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Image.asset("assets/images/logo.png" , height: 100 , width:900 ),

                ),
                //appName

                Text("Food Delivery" , style:TextStyle(fontSize: 36 ,fontWeight: FontWeight.bold) ),
                Gap(15),
                CustomTextField(controller: fullName, prefixIcon: Icons.person, labelText: "Full Name"),
                CustomTextField(controller: email, prefixIcon: Icons.email, labelText: "Email"),
                CustomTextField(controller: phone, prefixIcon: Icons.phone, labelText: "Mobile Number"),
                CustomTextField(controller: address, prefixIcon: Icons.location_city, labelText: "Address"),
                CustomTextField(controller: password, prefixIcon: Icons.password, labelText: "Password"),


                Gap(15),
                Row(
                  children: [
                    Expanded(child: ElevatedButton(onPressed:(){register(); }, child: Text("Sign Up", style:TextStyle(color:Colors.black)))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(" Aleardy Have Account?"),

                    GestureDetector(
                      onTap: ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false),
                        child: Text("Log In Now",style: TextStyle(color: Colors.blue),))
                  ],)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
