import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vehiclelist_controller.dart';

class VehiclelistView extends GetView<VehiclelistController> {
  const VehiclelistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VehiclelistView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VehiclelistView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
