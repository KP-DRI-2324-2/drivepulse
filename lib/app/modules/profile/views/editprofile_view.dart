import 'package:drivepulse/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileController());
    return const Scaffold(
      body: Center(
        child: Text("Edit Profile View"),
      ),
    );
  }
}
