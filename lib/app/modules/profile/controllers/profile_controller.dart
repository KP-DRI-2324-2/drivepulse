import 'package:drivepulse/app/modules/auth/views/auth_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;

  void increment() => count.value++;

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(const AuthView()); // Navigate to LoginView after sign out
    } catch (e) {
      // Handle sign-out errors
      print('Error signing out: $e');
    }
  }
}
