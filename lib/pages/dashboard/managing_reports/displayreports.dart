import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard/managing_reports_controller/adminreport_Controller.dart';
import '../../../repository/dashboard/admin_report/adminreport_repo.dart';


class DisplayReports extends StatelessWidget {
  final AdminReportController adminreportsController = Get.put(AdminReportController());

  @override
  Widget build(BuildContext context) {
    // Call fetchUserReports when this widget is built, for user ID 3 as per the endpoint
    adminreportsController.fetchUserReports(3);

    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
        /* actions: [
          ElevatedButton(onPressed: (){
            Get.to(() => CreateReport());
          }, child: Text("Create Report")),
        ],*/
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
                  subtitle: Text(report.description), // Displaying the description
                );
              },
            );
          }
        }),
      ),
    );
  }
}

