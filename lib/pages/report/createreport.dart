import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/report_controller.dart';

class CreateReport extends StatelessWidget {
  CreateReport({super.key});


  final ReportController controller = Get.find<ReportController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Create Report'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [

              buildTextField(controller.titleController, 'First Name', 'Enter your first name'),
              buildTextField(controller.descriptionController, 'Last Name', 'Enter your last name'),

              SizedBox(height: 20),
              Obx(() => ElevatedButton(
                onPressed: controller.loginLoadingState.value ? null : () => controller.reportsomthing(),
                child: controller.loginLoadingState.value
                    ? CircularProgressIndicator()
                    : Text('Save'),
              )),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildTextField(TextEditingController controller, String label, String hint, { TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }


}
