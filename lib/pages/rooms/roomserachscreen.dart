import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/roomsearch_controller.dart';

class RoomSearch extends StatelessWidget {
  final RoomSearchController roomSearchController = Get.find<RoomSearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: roomSearchController.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: roomSearchController.searchTextController,
                decoration: InputDecoration(labelText: 'Search'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a search term';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: roomSearchController.viewTextController,
                decoration: InputDecoration(labelText: 'View'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a view';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: roomSearchController.basePriceTextController,
                decoration: InputDecoration(labelText: 'Base Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a base price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: roomSearchController.averageRatingTextController,
                decoration: InputDecoration(labelText: 'Average Rating'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an average rating';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: roomSearchController.searchRooms,
                child: Text('Search'),
              ),
              SizedBox(height: 16),
              Obx(() {
                if (roomSearchController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (roomSearchController.rooms.isEmpty) {
                  return Center(child: Text('No rooms available'));
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: roomSearchController.rooms.length,
                    itemBuilder: (context, index) {
                      final room = roomSearchController.rooms[index];
                      return ListTile(
                        title: Text(room.roomNumber),
                        subtitle: Text('View: ${room.view}'),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}






