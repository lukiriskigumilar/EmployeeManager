

import 'dart:convert';

import 'package:employemanager/models/listemployee.dart';
import 'package:http/http.dart' as http ;


void main() async {
    Uri url = Uri.parse('https://reqres.in/api/users');
    var response = await http.get(url);
    
    List data = (json.decode(response.body) as Map<String,dynamic>)["data"];

    

    Datum employee = Datum.fromJson(data[2]);

    print(employee.toJson());

}