import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/pages/dashboard/managing_reports/roomadminclass.dart';
import '../../../controllers/dashboard/managing_rooms_controller/adminroom_controller.dart';


class AdminRoomSearch extends StatelessWidget {
  final AdminRoomController controller = Get.find<AdminRoomController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Rooms'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.searchTextController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter search keyword';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controller.viewTextController,
                decoration: InputDecoration(
                  labelText: 'View',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter view type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controller.statusTextController,
                decoration: InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter status';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  controller.searchRooms();
                },
                child: Text('Search'),
              ),
              SizedBox(height: 16),
              Obx(() {
                if (controller.isLoading.value) {
                  return CircularProgressIndicator();
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.roomss.length,
                      itemBuilder: (context, index) {
                        Roomm room = controller.roomss[index];
                        return RoomCard(room: room);
                      },
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final Roomm room;

  RoomCard({required this.room});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Room Number: ${room.roomNumber}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Floor: ${room.floor}'),
            Text('Status: ${room.status}'),
            Text('View: ${room.view}'),
            Text('Average Rating: ${room.averageRating}'),
            SizedBox(height: 8),
            Text(
              'Room Class: ${room.roomClass.className}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('Base Price: \$${room.roomClass.basePrice.toStringAsFixed(2)}'),
            Text('Bed Type: ${room.roomClass.bedType}'),
            Text('Number of Beds: ${room.roomClass.numberOfBeds}'),
            SizedBox(height: 8),
            Image.network(room.photo),  // Assuming `photo` is a URL
          ],
        ),
      ),
    );
  }
}
