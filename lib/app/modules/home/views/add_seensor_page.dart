import 'package:drivepulse/app/common/theme/fonts.dart';
import 'package:drivepulse/app/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:drivepulse/app/data/model/sensor_model.dart';
import 'package:get/get.dart';

class AddSensorPage extends StatelessWidget {
  AddSensorPage({Key? key}) : super(key: key);
  List<SensorModel> sensorList = getSensorList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Select Sensor', style: semiBoldText20),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by title of PID',
                      hintStyle: regularText16.copyWith(color: Colors.grey),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      // Handle filter action
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: sensorList.length,
                itemBuilder: (context, index) {
                  SensorModel sensor = sensorList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 5.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(8.0),
                      border: Border.all(
                          color: Colors.grey,
                          width: 0.5),
                    ),
                    child: ListTile(
                      title: Text(sensor.name, style: regularText18),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
