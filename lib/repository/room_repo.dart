import 'package:get/get.dart';
import 'package:untitled1/pages/rooms/roomdetailclass.dart';
import '../providers/api_provider.dart';


class RoomRepo extends GetxService {
final APIProvider apiProvider = Get.find<APIProvider>();

Future<List<RoomDetail>> getAllRooms() async {
  try {
    final response = await apiProvider.getRequest(
      "${APIProvider.url}getAllRooms",
      {},
      headers: {},
    );

    print("Response data: ${response.data}");

    if (response.statusCode == 200) {
      List<dynamic> roomsJson = response.data['data'];
      return roomsJson.map((json) => RoomDetail.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch rooms');
    }
  } catch (e) {
    print("Error fetching rooms: $e");
    throw e;
  }
}
}



