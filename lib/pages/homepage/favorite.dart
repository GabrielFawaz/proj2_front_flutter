import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../constant/appbar/circularappbarshape.dart';

class Favorite extends StatelessWidget {
  final List<dynamic> wishlistData;

  Favorite({required this.wishlistData}); // Updated constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Favorite', style: TextStyle(color: Colors.grey)), // Adjust title color
          backgroundColor: Colors.black,
          shape: CircularAppBarShape(),
          iconTheme: IconThemeData(color: Colors.grey)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            if (wishlistData.isEmpty)
              Center(child: Text('No favorites added yet')),
            if (wishlistData.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: wishlistData.length,
                  itemBuilder: (context, index) {
                    final item = wishlistData[index];
                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        title: Text(
                          'Room Number: ${item['room_number']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4),
                            Text(
                              'Status: ${item['status']}',
                              style: TextStyle(
                                fontSize: 16,
                                color: item['status'] == 'available'
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Floor: ${item['floor']}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        trailing: Icon(
                          Icons.room_rounded,
                          color: Colors.teal,
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

