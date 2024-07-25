import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/pages/rooms/roomdetailclass.dart';

import '../../constant/appbar/circularappbarshape.dart';
import '../../controllers/room/room_controller.dart'; // Replace with correct import

class RoomScreen extends StatelessWidget {
  final RoomController roomController = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Rooms', style: TextStyle(color: Colors.grey)), // Adjust title color
          backgroundColor: Colors.black,
          shape: CircularAppBarShape(),
          iconTheme: IconThemeData(color: Colors.grey)
      ),
      body: Obx(() {
        if (roomController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (roomController.error.value.isNotEmpty) { // Check if error is not empty
          return Center(child: Text('Error: ${roomController.error.value}'));
        } else if (roomController.rooms.isEmpty) {
          return Center(child: Text('No rooms available'));
        } else {
          return _buildRoomList(roomController.rooms);
        }
      }),
    );
  }

  Widget _buildRoomList(List<RoomDetail> rooms) { // Use RoomDetail as the type
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                final room = rooms[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    title: Text(
                      'Room ${room.roomNumber} - ${room.view} View',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text(
                          'Status: ${room.status}',
                          style: TextStyle(
                            fontSize: 16,
                            color: room.status == 'available'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Floor: ${room.floor}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.room_rounded,
                      color: Colors.teal,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





