import 'package:drivepulse/app/common/theme/buttons.dart';
import 'package:drivepulse/app/common/theme/fonts.dart';
import 'package:drivepulse/app/common/theme/theme.dart';
import 'package:drivepulse/app/shared/widgets/adbanner_widget.dart';
import 'package:flutter/material.dart';

class MonitoringView extends StatelessWidget {
  const MonitoringView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: themeData.highlightColor,
        backgroundColor: themeData.primaryColor,
        title: Text("Monitoring", style: boldText22.copyWith(color: themeData.highlightColor)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline)
            ),
        ],
      ),
      body: Column(
        children: [
          _buildTestMonitor('Test monitor Id 01', 'Range test', '150', '0', '100'),
          _buildTestMonitor('Test monitor Id 02', 'Voltage test', '15 V', '0 V', '20 V'),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // Handle refresh action
            },
            style: transparentButton,
            child: Text('Refresh', style: regularText14,),
          ),
          const SizedBox(height: 20,),
          const AdBannerWidget(),
        ],
      ),
    );
  }

  Widget _buildTestMonitor(String id, String testType, String value, String min, String max) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(id, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(testType),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Value'),
                    Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Minimum'),
                    Text(min),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Maximum'),
                    Text(max),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Result'),
                    Text('[ONLY IN PRO]'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}