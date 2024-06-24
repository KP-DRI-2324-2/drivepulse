import 'package:get/get.dart';

import '../controllers/vehiclelist_controller.dart';

class VehiclelistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehiclelistController>(
      () => VehiclelistController(),
    );
  }
}
