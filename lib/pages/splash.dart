import 'package:employemanager/pages/login.dart';
import 'package:employemanager/theme/theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
      super.initState();
      
      Timer(const Duration (seconds: 4) , () {
        Navigator.pushReplacement(context, 
        MaterialPageRoute(
          builder: (context) => const LoginPage())
        );
        
       });
    }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor:primaryColor,

    body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
             Text("EMPLOYEE MANAGER", style:whiteTextStyle.copyWith(fontSize: 20, fontWeight:bold)),
            
          ],
        ),
      ),
    ),

   );
  }
}