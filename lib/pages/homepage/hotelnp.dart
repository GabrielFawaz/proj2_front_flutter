import 'package:flutter/material.dart';

class HotelNP extends StatelessWidget {
  const HotelNP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample list of rooms
    final List<Room> rooms = [
      Room(
        imageUrl: 'assets/images/p1.jpg',
        des: "Cozy room suitable for a single person.",
        price: 100.0,
        capacity: 1,
        offers: ["10% Off on Spa Services", "Free Breakfast Included"],
      ),
      Room(
        imageUrl: 'assets/images/m.jpg',
        des: "Spacious room ideal for two persons.",
        price: 1000.0,
        capacity: 2,
        offers: ["20% Off on Room Service", "Complimentary Airport Transfer"],
      ),
      Room(
        imageUrl: 'assets/images/p1.jpg',
        des: "Comfortable room for up to three persons.",
        price: 250.0,
        capacity: 3,
        offers: ["15% Off on Laundry Service", "Free Gym Access"],
      ),
      Room(
        imageUrl: 'assets/images/sea.jpg',
        des: "Large suite perfect for a family of four.",
        price: 500.0,
        capacity: 4,
        offers: ["Special Discount on Extended Stays", "Free Wi-Fi"],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            return RoomCard(room: rooms[index]);
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
  final int capacity;
  final List<String> offers;

  Room({
    required this.imageUrl,
    required this.des,
    required this.price,
    required this.capacity,
    required this.offers,
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
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Capacity:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text("${room.capacity} persons"),
                    SizedBox(height: 8),
                    Text(
                      "Offers:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: room.offers
                          .map((offer) => Text("- $offer"))
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
