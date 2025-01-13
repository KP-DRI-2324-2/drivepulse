import 'package:drivepulse/app/modules/vehiclelist/views/vehiclelist_add_view.dart';
import 'package:drivepulse/app/modules/vehiclelist/views/vehiclelist_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/vehiclelist_controller.dart';
import '../../../data/model/vehicle_model.dart';
import 'package:drivepulse/app/common/theme/fonts.dart';

class VehiclelistView extends GetView<VehiclelistController> {
  const VehiclelistView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => VehiclelistController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle List',
            style: boldText22.copyWith(color: Colors.white)),
        backgroundColor: const Color(0xFFBF0000),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.vehicles.isEmpty) {
            return Center(
              child: Text('No vehicles found', style: regularText16),
            );
          }
          return ListView.builder(
            itemCount: controller.vehicles.length,
            itemBuilder: (context, index) {
              Vehicle vehicle = controller.vehicles[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: const Color(0xFFBF0000),
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
                              vehicle.name,
                              style: boldText22.copyWith(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                vehicle.model,
                                style: semiBoldText18.copyWith(
                                    color: Colors.white),
                              ),
                              PopupMenuButton<String>(
                                iconColor: Colors.white,
                                onSelected: (value) {
                                  if (value == 'Edit') {
                                    Get.to(() => EditVehiclePage(
                                        index: index, vehicleId: vehicle.id!));
                                  } else if (value == 'Delete') {
                                    _deleteVehicle(context, vehicle.id!);
                                  }
                                },
                                itemBuilder: (BuildContext context) {
                                  return {'Edit', 'Delete'}
                                      .map((String choice) {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(choice, style: regularText14),
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
                              child: _buildInfoChip('Year', '${vehicle.year}')),
                          const SizedBox(width: 8),
                          Expanded(child: _buildInfoChip('Type', vehicle.type)),
                          const SizedBox(width: 8),
                          Expanded(
                              child: _buildInfoChip(
                                  'CC', '${vehicle.displacement}')),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddVehiclePage()),
        backgroundColor: const Color(0xFFBF0000),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(label, style: regularText12.copyWith(color: Colors.white)),
          Text(value, style: boldText14.copyWith(color: Colors.white)),
        ],
      ),
    );
  }

  void _deleteVehicle(BuildContext context, String vehicleId) {
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
                controller.deleteVehicle(vehicleId);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBF0000),
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
