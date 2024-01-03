import 'dart:convert';

import 'package:employemanager/pages/homepage.dart';
import 'package:employemanager/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController(); 
TextEditingController passwordController = TextEditingController();

void login(BuildContext context,String email, password) async{
  try{
    Response response =  await post(
      Uri.parse('https://reqres.in/api/register'),
      body: {
        'email': email, 
        'password': password,
      }
    );
      if (!context.mounted) return;
    if (response.statusCode == 200){
     // Berhasil
      Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData.containsKey('token')) {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage()),
                (Route<dynamic> route) => false,
              );
      } else {
       _showSnackBar(context, "Email atau Password Salah");
      }

    }else{
           _showSnackBar(context, "Email atau Password Salah");
    }
  } catch(e){
    e.toString();
  }
}

void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
  );

  
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text("EMPLOYEE MANAGER", style:primaryTextColor.copyWith(fontSize: 20, fontWeight:bold)),

            //Form Input Email
             const SizedBox(height: 20,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email Addres",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            //Form input password
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 15,
            ),

            GestureDetector(
              onTap: () {
                login(context,emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 60, 
                width: 300, 
                decoration: BoxDecoration(
                  color: primaryColor, 
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Text("Sign In", style:whiteTextStyle,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
