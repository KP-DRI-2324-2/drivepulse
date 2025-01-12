import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/vehiclelist_controller.dart';
import '../../../data/model/vehicle_model.dart';
import 'package:drivepulse/app/common/theme/buttons.dart';
import 'package:drivepulse/app/common/theme/fonts.dart';

class EditVehiclePage extends StatelessWidget {
  final VehiclelistController controller = Get.find();
  final int index;
  final String vehicleId;
  final TextEditingController _vehicleNameController;
  final TextEditingController _manufacturerController;
  final TextEditingController _modelController;
  final TextEditingController _yearController;
  final TextEditingController _typeController;
  final TextEditingController _displacementController;

  EditVehiclePage({super.key, required this.index, required this.vehicleId})
      : _vehicleNameController = TextEditingController(),
        _manufacturerController = TextEditingController(),
        _modelController = TextEditingController(),
        _yearController = TextEditingController(),
        _typeController = TextEditingController(),
        _displacementController = TextEditingController() {
    Vehicle vehicleToEdit = controller.vehicles[index];
    _vehicleNameController.text = vehicleToEdit.name;
    _manufacturerController.text = vehicleToEdit.manufacturer;
    _modelController.text = vehicleToEdit.model;
    _yearController.text = vehicleToEdit.year.toString();
    _typeController.text = vehicleToEdit.type;
    _displacementController.text = vehicleToEdit.displacement.toString();
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
                child: Text('Save',
                    style: semiBoldText14.copyWith(color: Colors.white)),
                onPressed: () {
                  String vehicleName = _vehicleNameController.text.trim();
                  String manufacturer = _manufacturerController.text.trim();
                  String model = _modelController.text.trim();
                  int year = int.tryParse(_yearController.text) ?? 0;
                  String type = _typeController.text.trim();
                  int displacement =
                      int.tryParse(_displacementController.text) ?? 0;

                  if (vehicleName.isEmpty ||
                      manufacturer.isEmpty ||
                      model.isEmpty ||
                      year == 0 ||
                      type.isEmpty ||
                      displacement == 0) {
                    Get.snackbar('Error', 'Please fill all fields correctly');
                    return;
                  }

                  Vehicle updatedVehicle = Vehicle(
                    name: vehicleName,
                    manufacturer: manufacturer,
                    model: model,
                    year: year,
                    type: type,
                    displacement: displacement,
                  );

                  controller.editVehicle(vehicleId, updatedVehicle);
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
