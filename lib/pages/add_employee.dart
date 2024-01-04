import 'dart:convert';

import 'package:employemanager/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {

  TextEditingController nameEmployeeController = TextEditingController(); 
TextEditingController jobTittleController = TextEditingController();

void addEmployee(BuildContext context,String name, job) async{
  try{
    Response response =  await post(
      Uri.parse('https://reqres.in/api/users'),
      body: {
        'name':name, 
        'job': job,
      }
    );
      if (!context.mounted) return;
    if (response.statusCode == 201){
        var data = jsonDecode(response.body.toString());
        var id = data["id"];
        _showSnackBarTrue(context, "Data successfully created with ID $id");
      
      } else {
       _showSnackBar(context, "Data Failed to Create");
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

void _showSnackBarTrue(BuildContext context, String message) {
  final snackBarTrue = SnackBar(
    content: Text(message),
    backgroundColor: Colors.green,
  );
  
  ScaffoldMessenger.of(context).showSnackBar(snackBarTrue);
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:const Icon(Icons.close)),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: primaryColor,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text("ADD EMPLOYEE MANAGER", style:primaryTextColor.copyWith(fontSize: 20, fontWeight:bold)),

            //Form Input Email
             const SizedBox(height: 20,),
            TextField(
             controller: nameEmployeeController,
              decoration: InputDecoration(
                hintText: "Full Name Employee",
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
              controller: jobTittleController,
              decoration: InputDecoration(
                hintText: "Jobs Tittle",
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

       GestureDetector(
              onTap: () {
               addEmployee(context,nameEmployeeController.text.toString(), jobTittleController.text.toString());
              },
              child: Container(
                height: 60, 
                width: 300, 
                decoration: BoxDecoration(
                  color: primaryColor, 
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Text("Add Now", style:whiteTextStyle,),
                ),
              ),
            )
           
          ],
        ),
      ),
    );
  }
}