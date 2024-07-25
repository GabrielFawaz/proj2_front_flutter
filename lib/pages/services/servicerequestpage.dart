
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/appbar/circularappbarshape.dart';
import '../../controllers/services/services_controller.dart';

class ServiceRequestPage extends StatelessWidget {
  final ServicesController controller = Get.put(ServicesController());

  @override
  Widget build(BuildContext context) {

    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);


    return Scaffold(
      backgroundColor: Colors.blueGrey[50],

      appBar: AppBar(
        title: Text('Service Request', style: TextStyle(color: Colors.grey)), // Adjust title color
        backgroundColor: Colors.black,
        shape: CircularAppBarShape(),
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 50,),
              TextFormField(
                controller: controller.serviceIdController,
                decoration: InputDecoration(
                  labelText: "Service ID",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Service ID";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: controller.bookingIdController,
                decoration: InputDecoration(
                  labelText: "Booking ID",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Booking ID";
                  }
                  return null;
                },
              ),
              SizedBox(height: 35),
              Obx(() {
                if (controller.requestLoadingState.value) {
                  return CircularProgressIndicator();
                } else {
                  return Row(
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          print('11');
                          controller.submitServiceRequest();


                          /////////////////////////////////////////////
                        },
                        child: Text("Submit1", style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: customColor,
                        ),
                      ),
                      SizedBox(width: 40),


                      ElevatedButton (
                        onPressed:(){
                          controller.cancelServiceRequest();
                        },
                        ////////////////////////////////////////////

                        child: Text('Cancel ', style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: customColor,
                        ),
                      ),

                    ],
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
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
