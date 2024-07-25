import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/appbar/circularappbarshape.dart';
import '../../../controllers/dashboard/managing_users_controller/viewallusers_controller.dart';

class ViewAllUsers extends StatelessWidget {
  final  ViewAllUsersController controller = Get.put( ViewAllUsersController()); // Initialize GetX controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('View All Users', style: TextStyle(color: Colors.grey)), // Adjust title color
        backgroundColor: Colors.black,
        shape: CircularAppBarShape(),
          iconTheme: IconThemeData(color: Colors.grey)
      ),
      body: GetBuilder< ViewAllUsersController>(
        init: controller,
        builder: (controller) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.hasError) {
            return Center(child: Text('Error fetching users'));
          } else if (controller.users.isEmpty) {
            return Center(child: Text('No users found'));
          } else {

            return Padding(
              padding: const EdgeInsets.only(top: 35),
              child: ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final user = controller.users[index];
                  return Card(
                    color: Colors.white54,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Adjust card margin
                    elevation: 4, // Add elevation for shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                      side: BorderSide(color: Colors.grey, width: 1), // Border color and width
                    ),
                    child: ListTile(
                      title: Text(user.name, style: TextStyle(color: Colors.black)), // Adjust text color
                      subtitle: Text(user.email, style: TextStyle(color: Colors.grey)), // Adjust text color
                      onTap: () {
                        // Handle user tap if needed
                      },
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

