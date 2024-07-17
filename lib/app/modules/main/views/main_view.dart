import 'package:drivepulse/app/modules/home/views/home_view.dart';
import 'package:drivepulse/app/modules/profile/views/profile_view.dart';
import 'package:drivepulse/app/modules/vehiclelist/views/vehiclelist_view.dart';
import 'package:drivepulse/app/shared/widgets/botnavbar_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

// ignore: must_be_immutable
class MainView extends GetView<MainController> {
  var selectedIndex = 0.obs;

  MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                const VehiclelistView(),
                const ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: BotNavBarWidget(
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
          ),
        );
      },
    );
  }
}
