import 'package:flutter/material.dart';

class HotelS extends StatelessWidget {
  final List<Room> room = [
    Room(
      imageUrl: 'assets/images/m.jpg',
      des:
      "Nestled amidst lush greenery, our hotel offers a serene escape from the hustle and bustle of city life.",
      price: 100.0,
      services: ["Free Wi-Fi", "Breakfast Included"],
    ),
    Room(
      imageUrl: 'assets/images/m1.jpg',
      des:
      "With breathtaking views of the ocean, our beachfront hotel promises a rejuvenating stay filled with sun, sand, and sea.",
      price: 1000.0,
      services: ["Pool Access", "Spa Services"],
    ),
    Room(
      imageUrl: 'assets/images/hill1.jpg',
      des:
      "Experience unparalleled luxury and impeccable service at our five-star hotel, where every detail is meticulously crafted to exceed your expectations.",
      price: 250.0,
      services: ["Gym Access", "Room Service"],
    ),
    Room(
      imageUrl: 'assets/images/hill2.jpg',
      des:
      "Discover a fusion of modern elegance and traditional charm at our boutique hotel, where personalized experiences await around every corner.",
      price: 500.0,
      services: ["Free Wi-Fi", "Parking"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: room.length,
          itemBuilder: (context, index) {
            return RoomCard(room: room[index]);
          },
        ),
      ),
    );
  }
}

class Room {
  final String imageUrl;
  final double price;
  final String des;
  final List<String> services;

  Room({
    required this.imageUrl,
    required this.des,
    required this.price,
    required this.services,
  });
}

class RoomCard extends StatelessWidget {
  final Room room;

  RoomCard({required this.room});

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
                      '\$${room.price?.toStringAsFixed(2)}',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Services:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: room.services
                          .map((service) => Text("- $service"))
                          .toList(),
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
