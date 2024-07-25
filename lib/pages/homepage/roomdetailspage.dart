import 'package:flutter/material.dart';


/*class RoomDetailsPage extends StatelessWidget {
  final Map<String, dynamic> roomDetails;
  final String imageUrl;

  RoomDetailsPage({required this.roomDetails, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the image
            Center(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 10),
            Text("Room Number: ${roomDetails['room_number']}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Floor: ${roomDetails['floor']}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Status: ${roomDetails['status']}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("View: ${roomDetails['view']}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Class: ${roomDetails['room_class']['class_name']}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Price: ${roomDetails['room_class']['base_price']}", style: TextStyle(fontSize: 18)),
            // Add more fields as necessary
          ],
        ),
      ),
    );
  }
}*/


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../booking/bookingformpage.dart';
import '../booking/bookingroom.dart';

class RoomDetailsPage extends StatelessWidget {
  final Map<String, dynamic> roomDetails;
  final String imageUrl;

  RoomDetailsPage({required this.roomDetails, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);

    double averageRating = double.tryParse(roomDetails['average_rating'].toString()) ?? 0.0;
    int reviewsCount = roomDetails['reviews']?.length ?? 0;
    double basePrice = double.tryParse(roomDetails['room_class']['base_price'].toString()) ?? 0.0;
    String view = roomDetails['view'] ?? '';

    IconData viewIcon;
    if (view.toLowerCase() == 'sea') {
      viewIcon = Icons.water;
    } else if (view.toLowerCase() == 'garden') {
      viewIcon = Icons.park;
    } else {
      viewIcon = Icons.visibility; // Default icon
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4, // Set a fixed height for the image
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover, // Adjust this property to contain or cover the image
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Room Number: ${roomDetails['room_number']}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.blue),
                      SizedBox(width: 5),
                      Text(
                        "${roomDetails['floor']}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      for (int i = 0; i < averageRating.round(); i++)
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 14,
                        ),
                      SizedBox(width: 5),
                      Text(
                        averageRating.toString(),
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '$reviewsCount Reviews',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        '\$$basePrice',
                        style: TextStyle(fontSize: 16, color: customColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCategoryIcon(Icons.wifi, "WiFi"),
                        _buildCategoryIcon(Icons.ac_unit, "AC"),
                        _buildCategoryIcon(Icons.local_parking, "Parking"),
                        _buildCategoryIcon(Icons.restaurant, "Restaurant"),
                        _buildCategoryIcon(Icons.pool, "Pool"),
                        _buildCategoryIcon(Icons.lightbulb, "Electricity"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Room Class: ${roomDetails['room_class']['class_name']}",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Bed Type: ${roomDetails['room_class']['bed_type']}",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Number of Beds: ${roomDetails['room_class']['number_of_beds']}",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Status: ${roomDetails['status']}",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "View: $view",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        viewIcon,
                        color: Colors.blue,
                      ),


                    ],
                  ),

                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to room booking or any other action
                       Get.to(() => BookingFormPage());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(customColor),
                        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        ),
                        elevation: MaterialStateProperty.all<double>(10),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Text('Book Room'),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.all(12),
          child: Icon(
            icon,
            color: Colors.grey,
            size: 24,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}


/* ElevatedButton(
                    onPressed: () {
                      // Navigate to room booking or any other action
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RoomBooking()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(customColor),
                      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40)),
                      elevation: MaterialStateProperty.all<double>(10),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text('Book Hotel'),
                  ),*/