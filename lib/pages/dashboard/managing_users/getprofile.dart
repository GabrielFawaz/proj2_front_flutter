import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/appbar/circularappbarshape.dart';
import '../../../controllers/dashboard/managing_users_controller/getprofile_controller.dart';


class UserProfile extends GetView<GetProfileController> {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GetProfileController());

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
              () {
            if (controller.loading.value) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller.errorMessage.value.isNotEmpty) {
              return Center(child: Text(controller.errorMessage.value));
            }

            var profileData = controller.profileData;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('First Name: ${profileData['first_name']}'),
                Text('Last Name: ${profileData['last_name']}'),
                Text('Phone: ${profileData['phone']}'),
                Text('Address: ${profileData['address']}'),
                Text('Personal ID: ${profileData['personal_id']}'),
                // Add more fields as necessary
              ],
            );
          },
        ),
      ),
    );
  }
}


