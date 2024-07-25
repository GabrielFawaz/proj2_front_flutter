import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../dashboard/dashboardscreen.dart';
import '../profile/profile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Container(
              color: Colors.blueGrey[50],
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(0.0), // Adjust this value as needed
                  bottomRight: Radius.circular(0.0), // Adjust this value as needed
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width /1 ,
              height: MediaQuery.of(context).size.width /0.6,
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                Center(child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                  radius: 60,
                )),
                  SizedBox(height: 5,),
                  Center(child: Text("Lory DM",style: TextStyle(fontSize: 16),)),
                  ListTile(
                    leading: Icon(Icons.person),
                    title:
                         Text('Profile',),
                    onTap: () {
                      Get.to(Profile());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text('Dashboard'),
                    onTap: () {
                   Get.to(DashboardScreen());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('General Settings'),
                    onTap: () {
                      // Navigate to General Settings
                      Navigator.pushNamed(context, '/generalSettings');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
