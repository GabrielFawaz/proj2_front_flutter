import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/appbar/circularappbarshape.dart';
import '../../controllers/services/services_controller.dart';
import 'services.dart';

class ServicesPage extends StatelessWidget {
  final List<Service> services;

  ServicesPage({required this.services});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Services', style: TextStyle(color: Colors.grey)), // Adjust title color
          backgroundColor: Colors.black,
          shape: CircularAppBarShape(),
          iconTheme: IconThemeData(color: Colors.grey)
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return ListTile(
            title: Text(service.name),
            subtitle: Text('ID: ${service.id}'),
          );
        },
      ),
    );
  }
}



