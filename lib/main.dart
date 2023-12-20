import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Pages/Auth/log_in.dart';
import 'package:untitled/Pages/Auth/register_page.dart';
import 'package:untitled/Pages/splash.dart';

import 'package:untitled/provider/userprovider.dart';
import 'Pages/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Widgets/custom_tab_bar_widget.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(useMaterial3: true),
        home:FoodDeliver(),
        //home: ProfileScreen(),
      ),
    );
  }
}
