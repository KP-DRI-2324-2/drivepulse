import 'package:drivepulse/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    _checkAuthentication();
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/logo-a.png"),
      ),
    );
  }

  void _checkAuthentication() async {
    await Future.delayed(const Duration(seconds: 2));
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Get.offAllNamed(Routes.MAIN); // Navigate to main screen if logged in
      toast("Welcome back, ${user.displayName}!");
    } else {
      Get.offAllNamed(Routes.AUTH); // Navigate to login screen if not logged in
    }
  }
}
