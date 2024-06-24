import 'package:drivepulse/app/common/theme/buttons.dart';
import 'package:drivepulse/app/common/theme/fonts.dart';
import 'package:drivepulse/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/svg/logo-b.svg"),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text(
              "Log in to your account",
              style: mediumText22,
            ),
          ),
          // Google
          ElevatedButton(
            onPressed: () {
              toast("Loading...");
              Future.delayed(const Duration(seconds: 1), (() {
                Get.offAllNamed(Routes.MAIN);
                toast("Welcome!");
              }));
            },
            style: transparentButtonBlackBorder,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.circle,
                    color: Colors.red,
                  ),
                ),
                Text("Login with Google", style: mediumText14),
              ],
            ),
          ),
          // Facebook
          ElevatedButton(
            onPressed: () {},
            style: transparentButtonBlackBorder,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.circle,
                    color: Colors.blue,
                  ),
                ),
                Text("Login with Facebook", style: mediumText14),
              ],
            ),
          ),
          // Microsoft
          ElevatedButton(
            onPressed: () {},
            style: transparentButtonBlackBorder,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.circle,
                    color: Colors.green,
                  ),
                ),
                Text("Login with Microsoft", style: mediumText14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
