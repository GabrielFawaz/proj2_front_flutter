import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controllers/dashboard/managing_rooms_controller/adminroom_controller.dart';

import '../../../constant/appbar/circularappbarshape.dart';


/*class CreateRoom extends StatelessWidget {
  final CreateRoomController controller = Get.put(CreateRoomController());
  final Color customColor = Color.fromRGBO(255, 160, 42, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('Create Room', style: TextStyle(color: Colors.grey)), // Adjust title color
        backgroundColor: Colors.black,
        shape: CircularAppBarShape(),
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            _buildTextField('Status', controller.status, (value) => controller.status = value),
            SizedBox(height: 20),
            _buildTextField('Floor', controller.floor, (value) => controller.floor = value),
            SizedBox(height: 20),
            _buildTextField('Price', controller.price, (value) => controller.price= value),
            SizedBox(height: 20),
            _buildTextField('Type', controller.type, (value) => controller.type = value),
            SizedBox(height: 20),
            _buildPermissionDropdown(),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Call a method to handle user creation
                controller.createRoom();
              },
              child: Text('Create Room', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: customColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, String value, ValueChanged<String> onChanged) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
      onChanged: onChanged,
    );
  }



  Widget _buildPermissionDropdown() {
    return DropdownButtonFormField<UserType>(
      decoration: InputDecoration(
        labelText: 'Permission Type',
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
      value: controller.userType,
      onChanged: (UserType? value) {
        if (value != null) {
          controller.userType = value;
        }
      },
      items: UserType.values.map<DropdownMenuItem<UserType>>((UserType userType) {
        return DropdownMenuItem<UserType>(
          value: userType,
          child: Text(userType.toString()),
        );
      }).toList(),
    );
  }
}*/
