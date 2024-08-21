import 'package:drivepulse/app/common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drivepulse/app/common/theme/colors.dart';
import 'package:drivepulse/app/common/theme/fonts.dart';
import '../controllers/vehiclelist_controller.dart';
import 'vehiclelist_add_view.dart';
import 'vehiclelist_edit_view.dart';

class VehiclelistView extends GetView<VehiclelistController> {
  const VehiclelistView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => VehiclelistController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle List', style: boldText22.copyWith(color: Colors.white)),
        backgroundColor: const Color(0xFFBF0000),
        centerTitle: true,
      ),
      body: GetBuilder<VehiclelistController>(
        builder: (controller) {
          return Obx(
            () => ListView.builder(
              itemCount: controller.vehicles.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: AppColors.primaryColors[3],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                '${controller.vehicles[index].name} (${controller.vehicles[index].manufacturer})',
                                style: boldText22.copyWith(
                                    color: themeData.primaryColorDark),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Series ${controller.vehicles[index].model}',
                                  style: semiBoldText18.copyWith(
                                      color: themeData.canvasColor),
                                ),
                                PopupMenuButton<String>(
                                  onSelected: (value) {
                                    if (value == 'Edit') {
                                      Get.to(
                                          () => EditVehiclePage(index: index));
                                    } else if (value == 'Delete') {
                                      _deleteVehicle(context, index);
                                    }
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return {'Edit', 'Delete'}
                                        .map((String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child:
                                            Text(choice, style: regularText14),
                                      );
                                    }).toList();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                child: _buildInfoChip('Year',
                                    '${controller.vehicles[index].year}')),
                            const SizedBox(width: 8),
                            Expanded(
                                child: _buildInfoChip(
                                    'Type', controller.vehicles[index].type)),
                            const SizedBox(width: 8),
                            Expanded(
                                child: _buildInfoChip('CC',
                                    '${controller.vehicles[index].displacement}')),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddVehiclePage()),
        backgroundColor: kColorScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildInfoChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: kColorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(label, style: regularText12.copyWith(color: Colors.black)),
          Text(value, style: boldText14.copyWith(color: Colors.black)),
        ],
      ),
    );
  }

  void _deleteVehicle(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Vehicle', style: semiBoldText16),
          content:
              Text('Do you want to delete this vehicle?', style: regularText14),
          actions: <Widget>[
            TextButton(
              child: Text('No', style: regularText14),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              onPressed: () {
                controller.deleteVehicle(index);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text('Yes',
                  style: regularText14.copyWith(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
