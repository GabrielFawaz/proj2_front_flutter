import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controllers/booking/roombooking_controller.dart';

class BookingFormPage extends StatelessWidget {
  final BookingRoomController bookingController = Get.put(BookingRoomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Room'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: bookingController.formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: bookingController.roomIdController,
                decoration: InputDecoration(labelText: "Room ID"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Room ID';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: bookingController.checkInDateController,
                decoration: InputDecoration(labelText: "Check-in Date"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Check-in Date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: bookingController.checkOutDateController,
                decoration: InputDecoration(labelText: "Check-out Date"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Check-out Date';
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
                    return 'Please enter Number of Adults';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
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
                    return 'Please enter Number of Children';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: bookingController.paymentMethodController,
                decoration: InputDecoration(labelText: "Payment Method"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Payment Method';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: bookingController.bookRoom,
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
