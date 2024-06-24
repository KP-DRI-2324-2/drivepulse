import 'package:drivepulse/app/common/theme/theme.dart';
import 'package:drivepulse/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), (() {
      Get.offAllNamed(Routes.AUTH);
    }));
    return Scaffold(
      body: Center(
        child: SvgPicture.asset("assets/svg/logo-a.svg"),
      ),
    );
  }
}
