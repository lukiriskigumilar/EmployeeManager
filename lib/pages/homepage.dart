import 'package:employemanager/models/listemployee.dart';
import 'package:employemanager/pages/add_employee.dart';
import 'package:employemanager/pages/detailpage.dart';
import 'package:employemanager/service/listemployeeservice.dart';
import 'package:employemanager/theme/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<Datum> users = [];
   List<bool> isStarClicked = [];
  bool isLoading = true;

  void fetchUser() async {
    isLoading = true;
    final result = await UserService.fetchUsers();
    users = result;
   isStarClicked = List.generate(users.length, (index) => false);
    setState(() {});
    isLoading = false;
  }

  void showDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(user: users[index]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }
  

 
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text("List Employee", style: whiteTextStyle,),
        backgroundColor: primaryColor,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :

       ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            onTap: (){
               showDetails(index);
            },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.avatar),
          ),
          title: Text('${user.firstName} ${user.lastName}'),
          subtitle: Text(user.email),
          trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        isStarClicked[index] = !isStarClicked[index];
                      });
                    },
                    child: Icon(
                       isStarClicked[index]
                              ? Icons.star 
                              : Icons.star_border_outlined
                    ),
                  ),
                );
              },
              
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddEmployee()),
            );
        },
       tooltip: 'Increment',
        backgroundColor: secondaryColor,
       child:const Icon(Icons.add , color:Colors.white,),
      ),
    );
  }
}