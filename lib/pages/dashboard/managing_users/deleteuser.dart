import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/appbar/circularappbarshape.dart';
import '../../../controllers/dashboard/managing_users_controller/deleteuser_controller.dart';

class DeleteUser extends StatelessWidget {
  final DeleteUserController controller = Get.put(DeleteUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: controller.userIdController,
              keyboardType: TextInputType.number, // Assuming user ID is numeric
              decoration: InputDecoration(
                labelText: "User ID",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "User ID cannot be empty";
                }
                // You can add additional validation logic if needed
                return null;
              },
            ),
            SizedBox(height: 20),
            Obx(
                  () => ElevatedButton(
                onPressed: controller.deletionLoading.value
                    ? null
                    : () {
                  if (controller.userIdController.text.isNotEmpty) {
                    controller.deleteUser();
                  }
                },
                child: controller.deletionLoading.value
                    ? CircularProgressIndicator()
                    : Text("Delete User"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
