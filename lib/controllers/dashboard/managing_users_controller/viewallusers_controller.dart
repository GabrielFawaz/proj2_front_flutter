import 'package:get/get.dart';

import '../../../pages/dashboard/managing_users/user.dart';
class ViewAllUsersController extends GetxController {
  bool isLoading = true;
  bool hasError = false;
  List<User> users = [];

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    try {
      // Simulate network delay
      await Future.delayed(Duration(seconds: 2));

      // Replace with actual data fetching logic
      users = [
        User(id: '1', name: 'User One', email: 'userone@example.com'),
        User(id: '2', name: 'User Two', email: 'usertwo@example.com'),
        User(id: '3', name: 'User Three', email: 'userthree@example.com'),
      ];

      isLoading = false;
      hasError = false;
    } catch (e) {
      isLoading = false;
      hasError = true;
      print('Error fetching users: $e');
    }

    update(); // Notify GetX framework to rebuild UI
  }
}

// Dummy user data class
