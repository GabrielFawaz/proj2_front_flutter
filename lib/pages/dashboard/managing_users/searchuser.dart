import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/appbar/circularappbarshape.dart';
import '../../../controllers/dashboard/managing_users_controller/searchuser_controller.dart';

class SearchUser extends StatelessWidget {

  final SearchUserController controller = Get.put(SearchUserController());


  final TextEditingController _searchController = TextEditingController();

  void _searchUser() {
    // Implement your user search logic here
    String query = _searchController.text;
    // Call your API or service to search for the user
    print('Searching for user with query: $query');
    Get.snackbar('Search Results', 'User found: $query');
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('Search User', style: TextStyle(color: Colors.grey)), // Adjust title color
        backgroundColor: Colors.black,
        shape: CircularAppBarShape(),
          iconTheme: IconThemeData(color: Colors.grey)
      ),
     /* body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search by Name or Email',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _searchUser,
                child: Text('Search User', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: customColor,
              ),),
        
            ],
          ),
        ),
      ),*/

      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            _buildTextField('Search by Name or Email', controller.firstName, (value) => controller.firstName = value),
           SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                // Call a method to handle user creation
                controller.SearchUser();
              },
              child: Text('Search ', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: customColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, String value, ValueChanged<String> onChanged) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(10.0)
        ),

      ),
      onChanged: onChanged,
    );
  }


}
