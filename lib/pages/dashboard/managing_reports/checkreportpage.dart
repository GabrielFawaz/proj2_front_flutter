import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard/managing_reports_controller/adminreport_Controller.dart'; // Adjust the path as needed

class CheckReportsPage extends StatelessWidget {
  final AdminReportController Controller = Get.put(AdminReportController());

  @override
  Widget build(BuildContext context) {
    // Example report IDs to check
    List<int> reportIds = [1];

    return Scaffold(
      appBar: AppBar(
        title: Text('Check Reports'),
      ),
      body: Center(
        child: Obx(() {
          if (Controller.checkLoadingState.value) {
            return CircularProgressIndicator();
          } else {
            return ElevatedButton(
              onPressed: () {
                Controller.checkReports(reportIds);
              },
              child: Text('Check Reports'),
            );
          }
        }),
      ),
    );
  }
}
