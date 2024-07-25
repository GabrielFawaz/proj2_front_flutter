import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/dashboard/managing_reports_controller/adminreport_Controller.dart';
import '../../../repository/dashboard/admin_report/adminreport_repo.dart';

class ShowActiveReports extends StatelessWidget {
  final AdminReportController adminreportsController = Get.put(AdminReportController());

  @override
  Widget build(BuildContext context) {
    // Call fetchAllReports when this widget is built
    adminreportsController.ShowActiveReports();

    return Scaffold(
      appBar: AppBar(
        title: Text('Active Reports'),
      ),
      body: Center(
        child: Obx(() {
          if (adminreportsController.isLoading.value) {
            return CircularProgressIndicator();
          } else if (adminreportsController.reports.isEmpty) {
            return Text('No reports available');
          } else {
            return ListView.builder(
              itemCount: adminreportsController.reports.length,
              itemBuilder: (context, index) {
                Report report = adminreportsController.reports[index];
                return ListTile(
                  title: Text(report.title),
                  subtitle: Text(report.description),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
