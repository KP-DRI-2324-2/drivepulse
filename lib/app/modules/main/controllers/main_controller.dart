import 'package:drivepulse/app/data/model/botnavbar_model.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final BotNavBarModel bottomNavBarModel = BotNavBarModel();
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  final count = 0.obs;

  void increment() => count.value++;
}
