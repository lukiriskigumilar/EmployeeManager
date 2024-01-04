import 'package:employemanager/models/listemployee.dart';
import 'package:employemanager/theme/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Datum user;
  const DetailPage({super.key, required this.user});

  Widget imageDetail() {
    return Container(
        width: double.infinity,
        height: 330,
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 90,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(user.avatar),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "${user.firstName} ${user.lastName}",
              style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 30),
            ),
          ],
        ));
  }

  Widget emailDetail() {
    return Center(
        child: Container(
      width: 330,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.email, color: Colors.black),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.email,
                      style: blackTextColor.copyWith(
                          fontWeight: semiBold, fontSize: 15),
                    ),
                    Text("Email Address")
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

   Widget shareContact() {
    return Center(
        child: Container(
      width: 330,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.share, color: Colors.black),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.email,
                      style: blackTextColor.copyWith(
                          fontWeight: semiBold, fontSize: 15),
                    ),
                    Text("Share contact")
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.star_border_outlined,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageDetail(),
          const SizedBox(
            height: 30,
          ),
          emailDetail(),
          const SizedBox(
            height: 12,
          ), 
          shareContact()
        ],
      ),
    );
  }
}
