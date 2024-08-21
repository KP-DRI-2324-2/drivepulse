import 'package:get/get.dart';
import '../../../data/model/vehicle_model.dart';

class VehiclelistController extends GetxController {
  final vehicles = <Vehicle>[].obs;

  void addVehicle(String vehicle, String manufacturer, String modelValue, int yearValue, String typeValue, int displacementValue) {
    vehicles.add(Vehicle(
      name: vehicle,
      manufacturer: manufacturer,
      model: modelValue,
      year: yearValue,
      type: typeValue,
      displacement: displacementValue,
    ));
  }

  void editVehicle(int index, String vehicle, String manufacturer, String modelValue, int yearValue, String typeValue, int displacementValue) {
    vehicles[index] = Vehicle(
      name: vehicle,
      manufacturer: manufacturer,
      model: modelValue,
      year: yearValue,
      type: typeValue,
      displacement: displacementValue,
    );
  }

  void deleteVehicle(int index) {
    vehicles.removeAt(index);
  }
}
