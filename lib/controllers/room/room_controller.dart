import 'package:get/get.dart';

import '../../pages/rooms/roomdetailclass.dart';
import '../../repository/room_repo.dart';
// Replace with your actual repo import

class RoomController extends GetxController {
  final RoomRepo roomRepo = Get.find<RoomRepo>();

  var isLoading = false.obs;
  var rooms = <RoomDetail>[].obs;
  var error = RxString(''); // RxString for reactive error handling

  @override
  void onInit() {
    fetchRooms();
    super.onInit();
  }

  Future<void> fetchRooms() async {
    try {
      isLoading.value = true;
      List<RoomDetail> roomsList = await roomRepo.getAllRooms();
      print("Fetched rooms: $roomsList");
      rooms.assignAll(roomsList);
      error.value = ''; // Clear any previous errors on success
    } catch (e) {
      print("Error fetching rooms: $e");
      error.value = 'Failed to fetch rooms: $e'; // Store error message on failure
    } finally {
      isLoading.value = false;
    }
  }
}



