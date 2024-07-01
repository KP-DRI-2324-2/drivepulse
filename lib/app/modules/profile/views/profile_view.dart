import 'package:drivepulse/app/common/theme/buttons.dart';
import 'package:drivepulse/app/common/theme/fonts.dart';
import 'package:drivepulse/app/common/theme/theme.dart';
import 'package:drivepulse/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileController());
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color(0xFFBF0000),
        title: Text(
          'Profile',
          style: boldText22.copyWith(color: Colors.white),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Component
            Stack(
              children: [
                Container(
                  height: 220,
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: boxDecorationWithRoundedCorners(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.6],
                      colors: [
                        Color(0xFFBF0000),
                        Color(0xFF590000),
                      ],
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 80.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() {
                        String photoUrl = controller.userPhotoUrl.value;
                        return CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 70,
                          backgroundImage: photoUrl.isNotEmpty
                              ? NetworkImage(photoUrl)
                              : null,
                          child: photoUrl.isEmpty
                              ? const Icon(Icons.person,
                                  size: 70, color: Colors.white)
                              : null,
                        );
                      }),
                      const SizedBox(height: 16),
                      Obx(() {
                        String name = controller.userName.value;
                        return Text(
                          name,
                          style: boldText22.copyWith(color: Colors.white),
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
            // Profile Settings Component
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profile",
                    style: semiBoldText18,
                  ),
                  const SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Edit Profile",
                            style: regularText16,
                          ),
                          const Icon(
                            Icons.chevron_right,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Notification Settings Component
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notification",
                    style: semiBoldText18,
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email Notifications",
                          style: regularText16,
                        ),
                        Obx(() {
                          return CupertinoSwitch(
                            value: controller.isEmailNotificationEnabled.value,
                            onChanged: controller.toggleEmailNotification,
                          );
                        }),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "App Notifications",
                          style: regularText16,
                        ),
                        Obx(() {
                          return CupertinoSwitch(
                            value: controller.isAppNotificationEnabled.value,
                            onChanged: controller.toggleAppNotification,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // App Settings Component
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "App",
                    style: semiBoldText18,
                  ),
                  const SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "FAQ",
                            style: regularText16,
                          ),
                          const Icon(
                            Icons.chevron_right,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Terms of Use",
                            style: regularText16,
                          ),
                          const Icon(
                            Icons.chevron_right,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Version",
                            style: regularText16,
                          ),
                          Text(
                            "1.0.0",
                            style: regularText14.copyWith(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.signOut();
                      },
                      style: primaryButton,
                      child: Text(
                        "Logout",
                        style: boldText16.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
