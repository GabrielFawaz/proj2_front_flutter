import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/dashboard/managing_rooms_controller/adminroom_controller.dart'; // Adjust the path as needed

class AdminRoomDetails extends StatelessWidget {
  final AdminRoomController controller = Get.put(AdminRoomController());

  @override
  Widget build(BuildContext context) {
    final int roomId = 3; // Example room ID
    controller.fetchRoomDetails(roomId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Room Details'),
      ),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return CircularProgressIndicator();
          } else if (controller.roomDetail.value == null) {
            return Text('No room details available');
          } else {
            final roomDetail = controller.roomDetail.value!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${roomDetail.id}'),
                  Text('Floor: ${roomDetail.floor}'),
                  Text('Status: ${roomDetail.status}'),
                  Text('Room Number: ${roomDetail.roomNumber}'),
                  Text('Room Class ID: ${roomDetail.roomClassId}'),
                  Text('Average Rating: ${roomDetail.averageRating}'),
                  Text('View: ${roomDetail.view}'),
                  Text('Photo: ${roomDetail.photo}'),
                  Text('Created At: ${roomDetail.createdAt}'),
                  Text('Updated At: ${roomDetail.updatedAt}'),
                  SizedBox(height: 16),
                  Text('Room Class:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Class Name: ${roomDetail.roomClass.className}'),
                  Text('Base Price: ${roomDetail.roomClass.basePrice}'),
                  Text('Bed Type: ${roomDetail.roomClass.bedType}'),
                  Text('Number of Beds: ${roomDetail.roomClass.numberOfBeds}'),
                  Text('Created At: ${roomDetail.roomClass.createdAt}'),
                  Text('Updated At: ${roomDetail.roomClass.updatedAt}'),
                  // Add sections for reviews and occupied times if needed
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
