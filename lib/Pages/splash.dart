import 'package:flutter/material.dart';
import 'package:untitled/Pages/main_page.dart';
import 'package:untitled/Widgets/custom_tab_bar_widget.dart';

class FoodDeliver extends StatefulWidget {
  const FoodDeliver({Key? key}) : super(key: key);

  @override
  _FoodDeliverState createState() => _FoodDeliverState();
}

class _FoodDeliverState extends State<FoodDeliver> {
  @override
  void initState() {
    super.initState();
    // Add a delay of 1 second before navigating to the main page
    Future.delayed(Duration(milliseconds:3000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomTabBar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(231, 108, 56, 1.0),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "Food Delivery",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Image.asset("assets/images/Splash.png"),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Your main page content goes here
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Text("Welcome to the Main Page!"),
      ),
    );
  }
}