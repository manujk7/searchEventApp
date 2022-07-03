import 'package:get/get.dart';

import '../../appPages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    nextScreen();
    super.onInit();
  }

  void nextScreen() async {
    Future.delayed(const Duration(milliseconds: 3000)).then((value) async {
      Get.toNamed(Routes.searchListingScreen);
    });
  }
}
