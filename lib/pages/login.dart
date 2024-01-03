import 'package:employemanager/theme/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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

             const SizedBox(height: 20,),
            TextField(
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
            TextField(
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

            Container(
              height: 60, 
              width: 300, 
              decoration: BoxDecoration(
                color: primaryColor, 
                borderRadius: BorderRadius.circular(30)
              ),
              child: Center(
                child: Text("Sign in", style:whiteTextStyle,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
