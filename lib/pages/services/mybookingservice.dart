import 'package:flutter/material.dart';

import '../../constant/appbar/circularappbarshape.dart';
import 'services.dart';

class MyBookingService extends StatelessWidget {
  final List<Service> services;

  MyBookingService({required this.services});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Booking Services'),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return ListTile(
            title: Text(service.name),
          //  subtitle: Text(service.description),
         //   trailing: Text('\$${service.price}'),
          );
        },
      ),
    );
  }
}