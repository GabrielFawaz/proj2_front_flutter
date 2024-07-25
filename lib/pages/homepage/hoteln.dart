import 'package:flutter/material.dart';

class HotelN extends StatelessWidget {
  final List<Room> rooms = [
    Room(
      imageUrl: 'assets/images/m.jpg',
      des: "Nestled amidst lush greenery, our hotel offers a serene escape from the hustle and bustle of city life.",
      view: "Hill View",
    ),
    Room(
      imageUrl: 'assets/images/m1.jpg',
      des: "With breathtaking views of the ocean, our beachfront hotel promises a rejuvenating stay filled with sun, sand, and sea.",
      view: "Ocean View",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            return RoomView(room: rooms[index]);
          },
        ),
      ),
    );
  }
}

class Room {
  final String imageUrl;
  final String des;
  final String view;

  Room({
    required this.imageUrl,
    required this.des,
    required this.view,
  });
}

class RoomView extends StatelessWidget {
  final Room room;

  RoomView({required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'room_image_${room.imageUrl}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    room.imageUrl,
                    fit: BoxFit.cover,
                    height: 140,
                    width: 140,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${room.des}",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "View:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${room.view}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
