import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/dashboard/managing_rooms_controller/admindelcreate_controller.dart';


/*
class RoomListScreen extends StatelessWidget {
  final AdminDelCreateController controller = Get.find<AdminDelCreateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Room List"),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.roomList.length,
          itemBuilder: (context, index) {
            var room = controller.roomList[index];
            return RoomItem(
              roomId: room.id,
              roomName: room.roomNumber, // Display room name or identifier
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle adding new room
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
*/
