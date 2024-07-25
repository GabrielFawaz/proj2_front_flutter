import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/pages/dashboard/managing_rooms/roomclass.dart';

import '../../../controllers/dashboard/managing_rooms_controller/adminroom_controller.dart'; // Adjust the path as needed

class AdminAllRooms extends StatelessWidget {
  final AdminRoomController adminRoomController = Get.put(AdminRoomController());

  @override
  Widget build(BuildContext context) {
    // Fetch rooms when the widget is built
    adminRoomController.getAllRooms();

    return Scaffold(
      appBar: AppBar(
        title: Text('All Rooms'),
      ),
      body: Center(
        child: Obx(() {
          if (adminRoomController.isLoading.value) {
            return CircularProgressIndicator();
          } else if (adminRoomController.rooms.isEmpty) {
            return Text('No rooms available');
          } else {
            return ListView.builder(
              itemCount: adminRoomController.rooms.length,
              itemBuilder: (context, index) {
                RoomDetail room = adminRoomController.rooms[index];
                return ListTile(
                  title: Text('Room ${room.roomNumber}'),
                  subtitle: Text('Status: ${room.status}, Floor: ${room.floor}'),
                  leading: Image.network(room.photo), // Assuming photo is a URL
                  onTap: () {
                    // Navigate to room details page or show details dialog
                    // Example: Get.to(() => RoomDetailsPage(roomId: room.id));
                  },
                );
              },
            );
          }
        }),
      ),
    );
  }
}

