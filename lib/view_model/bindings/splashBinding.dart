import 'package:get/get.dart';
import '../controller/mainController.dart';
import '../controller/splashController.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    Get.put<MainController>(MainController(), permanent: true);
  }
}
