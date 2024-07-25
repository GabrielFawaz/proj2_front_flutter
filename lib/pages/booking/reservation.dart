import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../controllers/booking/reservation_controller.dart';



class Reservation extends StatelessWidget {
  final ReservationController reservationController = Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation Page'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              focusedDay: reservationController.selectedDay.value,
              selectedDayPredicate: (day) {
                return isSameDay(reservationController.selectedDay.value, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                reservationController.selectedDay.value = selectedDay;
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  if (reservationController.bookedDays.contains(day)) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        '${day.day}',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return null;
                },
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.deepOrange,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                leftChevronIcon: Icon(Icons.chevron_left, color: Colors.teal),
                rightChevronIcon: Icon(Icons.chevron_right, color: Colors.teal),
              ),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final selectedDay = reservationController.selectedDay.value;
                reservationController.bookDay(selectedDay);
                Get.snackbar(
                  'Booked',
                  'You have booked ${selectedDay.toLocal().toString().split(' ')[0]}',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.teal,
                  colorText: Colors.white,
                );
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('Book Selected Day'),
            ),
          ],
        ),
      ),
    );
  }
}

