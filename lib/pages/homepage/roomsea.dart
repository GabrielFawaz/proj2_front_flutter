import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../controllers/homepage/roomsea_controller.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package

class RoomSeaView extends GetView<RoomSeaController> {
  final List<Room> room = [
    Room(
      imageUrl: 'assets/images/sea.jpg',
      des:
      "Nestled amidst lush greenery, our hotel offers a serene escape from the hustle and bustle of city life.",
      price: 100.0,
    ),
    Room(
      imageUrl: 'assets/images/sea1.jpg',
      des:
      "With breathtaking views of the ocean, our beachfront hotel promises a rejuvenating stay filled with sun, sand, and sea.",
      price: 1000.0,
    ),
    Room(
      imageUrl: 'assets/images/sea2.jpg',
      des:
      "Experience unparalleled luxury and impeccable service at our five-star hotel, where every detail is meticulously crafted to exceed your expectations.",
      price: 250.0,
    ),
    Room(
      imageUrl: 'assets/images/sea.jpg',
      des:
      "Experience unparalleled luxury and impeccable service at our five-star hotel, where every detail is meticulously crafted to exceed your expectations.",
      price: 250.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);

    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Set background color
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back), // Back button icon
                onPressed: () {
                  Get.back(); // Navigate back using GetX
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: room.length,
                itemBuilder: (context, index) {
                  return RoomCard(room: room[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Room {
  final String imageUrl;
  final double price;
  final String des;

  Room({
    required this.imageUrl,
    required this.des,
    required this.price,
  });
}

class RoomCard extends StatelessWidget {
  final Room room;

  RoomCard({required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, // Adjust as needed
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set card background color
              borderRadius: BorderRadius.circular(8),
              border: Border(
                top: BorderSide(
                  color: Color(0xFF2B74FE), // Set the border color
                  width: 2, // Set the border width
                ),
                left: BorderSide(
                  color: Color(0xFF2B74FE), // Set the border color
                  width: 2, // Set the border width
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Card(
              elevation: 0, // Remove Card's default elevation
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'room_image_${room.imageUrl}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        topRight: Radius.circular(20), // Adjust the radius as needed
                        bottomRight: Radius.circular(20), // Adjust the radius as needed
                      ),
                      child: Image.asset(
                        room.imageUrl,
                        fit: BoxFit.cover, // Ensure the entire image is visible
                        height: 140, // Adjust the height as needed
                        width: 140, // Adjust the width as needed
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${room.des}",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '\$${room.price?.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
