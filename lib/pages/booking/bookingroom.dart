import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../controllers/booking/roombooking_controller.dart';
import '../homepage/homepage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*class BookingScreen extends StatelessWidget {
  final BookingRoomController bookingController = Get.put(BookingRoomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book a Room"),
      ),
      body: Form(
        key: bookingController.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: bookingController.roomIdController,
                decoration: InputDecoration(labelText: "Room ID"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a room ID";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: bookingController.checkInDateController,
                decoration: InputDecoration(labelText: "Check-in Date"),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a check-in date";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: bookingController.checkOutDateController,
                decoration: InputDecoration(labelText: "Check-out Date"),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a check-out date";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: bookingController.numAdultsController,
                decoration: InputDecoration(labelText: "Number of Adults"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the number of adults";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: bookingController.numChildrenController,
                decoration: InputDecoration(labelText: "Number of Children"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the number of children";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: bookingController.paymentMethodController,
                decoration: InputDecoration(labelText: "Payment Method"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a payment method";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: bookingController.bookRoom,  child: Text("Book Room"),)
             ,
            ],
          ),
        ),
      ),
    );
  }
}*/

class BookingSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Success"),
      ),
      body: Center(
        child: Text("Your booking was successful!"),
      ),
    );
  }
}
