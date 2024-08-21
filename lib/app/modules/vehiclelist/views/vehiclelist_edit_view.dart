import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/vehiclelist_controller.dart';
import '../../../data/model/vehicle_model.dart';
import 'package:drivepulse/app/common/theme/buttons.dart';
import 'package:drivepulse/app/common/theme/fonts.dart';

class EditVehiclePage extends GetView<VehiclelistController> {
  final int index;
  late final TextEditingController _vehicleNameController;
  late final TextEditingController _manufacturerController;
  late final TextEditingController _modelController;
  late final TextEditingController _yearController;
  late final TextEditingController _typeController;
  late final TextEditingController _displacementController;

  EditVehiclePage({super.key, required this.index}) {
    Vehicle vehicleToEdit = controller.vehicles[index];
    _vehicleNameController = TextEditingController(text: vehicleToEdit.name);
    _manufacturerController =
        TextEditingController(text: vehicleToEdit.manufacturer);
    _modelController = TextEditingController(text: vehicleToEdit.model);
    _yearController =
        TextEditingController(text: vehicleToEdit.year.toString());
    _typeController = TextEditingController(text: vehicleToEdit.type);
    _displacementController =
        TextEditingController(text: vehicleToEdit.displacement.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Vehicle', style: semiBoldText20),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _vehicleNameController,
                decoration: InputDecoration(
                  labelText: 'Vehicle Name',
                  labelStyle: regularText16,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _manufacturerController,
                decoration: InputDecoration(
                  labelText: 'Manufacturer',
                  labelStyle: regularText16,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _modelController,
                decoration: InputDecoration(
                  labelText: 'Model',
                  labelStyle: regularText16,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _yearController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Year',
                  labelStyle: regularText16,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _typeController,
                decoration: InputDecoration(
                  labelText: 'Type',
                  labelStyle: regularText16,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _displacementController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Displacement (cc)',
                  labelStyle: regularText16,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: primaryButton,
                child: Text('Save', style: semiBoldText14),
                onPressed: () {
                  String vehicleName = _vehicleNameController.text;
                  String manufacturer = _manufacturerController.text;
                  String model = _modelController.text;
                  int year = int.tryParse(_yearController.text) ?? 0;
                  String type = _typeController.text;
                  int displacement =
                      int.tryParse(_displacementController.text) ?? 0;

                  controller.editVehicle(index, vehicleName, manufacturer,
                      model, year, type, displacement);
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
