import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../constant/appbar/circularappbarshape.dart';
import '../../../controllers/dashboard/managing_users_controller/banunbanuser_controller.dart';

class BanUnbanUser extends StatelessWidget {
  final TextEditingController userIdController = TextEditingController();
  final Color customColor = Color.fromRGBO(255, 160, 42, 1.0);
  final BanUnbanController banUnbancontroller = Get.find<BanUnbanController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('View All Users', style: TextStyle(color: Colors.grey)), // Adjust title color
        backgroundColor: Colors.black,
        shape: CircularAppBarShape(),
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30),
              TextField(
                controller: userIdController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: 'Enter User ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String userId = userIdController.text;
                  if (userId.isNotEmpty) {
                    int id = int.parse(userId);
                    banUnbancontroller.banUser(id);
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please enter a valid User ID',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: Text('Ban User', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: customColor,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  String userId = userIdController.text;
                  // Call unbanUser method when it's implemented
                  Get.snackbar(
                    'User Unbanned',
                    'User $userId has been unbanned',
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                },
                child: Text('Unban User', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: customColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
