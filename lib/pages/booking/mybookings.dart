import 'package:flutter/material.dart';

import '../../controllers/booking/roombooking_controller.dart';
import 'bookingclass.dart';
 // Import your Booking model or class

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('\nMyBookings page opened');
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Optionally return data back to previous screen
            Get.back(result: 'SomeData');
          },
          child: Text('Return to Profile'),
        ),
      ),
    );
  }
}
