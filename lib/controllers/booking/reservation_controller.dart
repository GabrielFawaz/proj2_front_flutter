import 'package:get/get.dart';


class ReservationController extends GetxController {
  RxList<DateTime> bookedDays = <DateTime>[].obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;

  void bookDay(DateTime day) {
    if (!bookedDays.contains(day)) {
      bookedDays.add(day);
    }
  }
}
