import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/vehiclelist_controller.dart';
import 'package:drivepulse/app/common/theme/buttons.dart';
import 'package:drivepulse/app/common/theme/fonts.dart';

class AddVehiclePage extends StatelessWidget {
  final VehiclelistController controller = Get.find();
  final TextEditingController vehicleNameController = TextEditingController();
  final TextEditingController manufacturerController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController displacementController = TextEditingController();

  AddVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Vehicle', style: semiBoldText20),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: vehicleNameController,
                decoration: InputDecoration(
                  labelText: 'Vehicle Name',
                  labelStyle: regularText16,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: manufacturerController,
                decoration: InputDecoration(
                  labelText: 'Manufacturer',
                  labelStyle: regularText16,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: modelController,
                decoration: InputDecoration(
                  labelText: 'Model',
                  labelStyle: regularText16,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: yearController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Year',
                  labelStyle: regularText16,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  labelText: 'Type',
                  labelStyle: regularText16,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: displacementController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Displacement (cc)',
                  labelStyle: regularText16,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: primaryButton,
                child: Text('Confirm', style: semiBoldText14),
                onPressed: () {
                  String vehicleName = vehicleNameController.text;
                  String manufacturer = manufacturerController.text;
                  String model = modelController.text;
                  int year = int.tryParse(yearController.text) ?? 0;
                  String type = typeController.text;
                  int displacement =
                      int.tryParse(displacementController.text) ?? 0;

                  controller.addVehicle(vehicleName, manufacturer, model, year,
                      type, displacement);
                  Get.back();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
