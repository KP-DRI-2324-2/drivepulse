import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.changeTheme(
                Get.isDarkMode ? ThemeData.dark() : ThemeData.light());
          },
          child: Container(
            padding: const EdgeInsets.all(50.0),
            color: Colors.red,
            child: const Text(
              'Press Me',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
