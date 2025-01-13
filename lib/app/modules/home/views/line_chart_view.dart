import 'package:drivepulse/app/common/theme/fonts.dart';
import 'package:drivepulse/app/common/theme/theme.dart';
import 'package:drivepulse/app/modules/home/views/add_sensor_page.dart';
import 'package:drivepulse/app/shared/widgets/adbanner_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/linechartwidget.dart';

class LineChartView extends StatelessWidget {
  LineChartView({super.key});

  final ValueNotifier<bool> isSeparatedChart = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: themeData.highlightColor,
        backgroundColor: themeData.primaryColor,
        title: Text(
          'Line Chart',
          style: boldText22.copyWith(color: themeData.highlightColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ValueListenableBuilder<bool>(
              valueListenable: isSeparatedChart,
              builder: (context, value, child) {
                return Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => isSeparatedChart.value = true,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              value ? Colors.red : Colors.grey[300],
                          foregroundColor: value ? Colors.white : Colors.black,
                        ),
                        child: const Text('Separated Chart'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => isSeparatedChart.value = false,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              !value ? Colors.red : Colors.grey[300],
                          foregroundColor: !value ? Colors.white : Colors.black,
                        ),
                        child: const Text('Combined Chart'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<bool>(
              valueListenable: isSeparatedChart,
              builder: (context, value, child) {
                return value
                    ? const SeparatedChartView()
                    : const CombinedChartView();
              },
            ),
          ),
          const AdBannerWidget(),
        ],
      ),
    );
  }
}

class SeparatedChartView extends StatelessWidget {
  const SeparatedChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: linechartwidget(isSeparated: true),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => Get.to(() => AddSensorPage()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text('Add Sensor',
                  style: semiBoldText14.copyWith(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

class CombinedChartView extends StatelessWidget {
  const CombinedChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: linechartwidget(isSeparated: false),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: () => Get.to(() => AddSensorPage()),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: Text('Add First Sensor',
                style: semiBoldText14.copyWith(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: () => Get.to(() => AddSensorPage()),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: Text('Add Second Sensor', style: semiBoldText14),
          ),
        ),
      ],
    );
  }
}
