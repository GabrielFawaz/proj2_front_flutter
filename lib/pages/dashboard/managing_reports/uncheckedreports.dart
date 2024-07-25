import 'package:flutter/material.dart';

import '../../../constant/appbar/circularappbarshape.dart';

class UncheckedReports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Text('Unckecked Reports', style: TextStyle(color: Colors.grey)), // Adjust title color
          backgroundColor: Colors.black,
          shape: CircularAppBarShape(),
          iconTheme: IconThemeData(color: Colors.grey),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Text(
                'Unchecked Reports',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 20),
              UncheckedReportCard(
                reportTitle: 'Daily Revenue',
                userId: 'User123',
                onTap: () {
                  // Handle onTap event
                },
              ),
              SizedBox(height: 10),
              UncheckedReportCard(
                reportTitle: 'Weekly Occupancy Rate',
                userId: 'User456',
                onTap: () {
                  // Handle onTap event
                },
              ),
              // Add more unchecked report cards as needed
            ],
          ),
        ),
      ),
    );
  }
}

class UncheckedReportCard extends StatelessWidget {
  final String reportTitle;
  final String userId;
  final VoidCallback onTap;

  UncheckedReportCard({
    required this.reportTitle,
    required this.userId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(
          reportTitle,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('User ID: $userId'),
        onTap: onTap,
      ),
    );
  }
}
