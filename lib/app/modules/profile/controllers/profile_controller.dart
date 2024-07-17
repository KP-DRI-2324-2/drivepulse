import 'package:drivepulse/app/modules/auth/views/auth_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final userName = ''.obs;
  final userPhotoUrl = ''.obs;

  final isEmailNotificationEnabled = false.obs;
  final isAppNotificationEnabled = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    _fetchUserData();
  }

  void _fetchUserData() {
    User? user = _auth.currentUser;
    if (user != null) {
      userName.value = user.displayName ?? "Anonymous";
      userPhotoUrl.value = user.photoURL ?? "";
    }
  }

  void toggleEmailNotification(bool value) {
    isEmailNotificationEnabled.value = value;
  }

  void toggleAppNotification(bool value) {
    isAppNotificationEnabled.value = value;
  }

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
