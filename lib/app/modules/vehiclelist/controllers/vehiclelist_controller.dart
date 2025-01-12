import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../data/model/vehicle_model.dart';

class VehiclelistController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _vehiclesCollection =
      FirebaseFirestore.instance.collection('vehicles');

  final vehicles = <Vehicle>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchVehicles();
  }

  void fetchVehicles() {
    _vehiclesCollection.snapshots().listen((snapshot) {
      vehicles.value = snapshot.docs.map((doc) {
        return Vehicle.fromFirestore(doc);
      }).toList();
    });
  }

  Future<void> addVehicle(Vehicle vehicle) async {
    try {
      await _vehiclesCollection.add(vehicle.toMap());
      Get.snackbar('Success', 'Vehicle added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add vehicle: $e');
    }
  }

  Future<void> editVehicle(String id, Vehicle vehicle) async {
    try {
      await _vehiclesCollection.doc(id).update(vehicle.toMap());
      Get.snackbar('Success', 'Vehicle updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update vehicle: $e');
    }
  }

  Future<void> deleteVehicle(String id) async {
    try {
      await _vehiclesCollection.doc(id).delete();
      Get.snackbar('Success', 'Vehicle deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete vehicle: $e');
    }
  }
}
