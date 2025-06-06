import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/controller/HomeController.dart';

import '../model/five_days_data.dart';

class MyChart extends GetView<HomeController> {
  const MyChart({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <CartesianSeries<dynamic, dynamic>>[
            SplineSeries<FiveDayData, String>(
              dataSource: controller.fiveDaysData,
              xValueMapper: (FiveDayData f, _) => f.dateTime,
              yValueMapper: (FiveDayData f, _) => f.temp,
            ),
          ],
        ),
      ),
    );
  }
}