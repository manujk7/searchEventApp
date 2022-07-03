import 'package:get/get.dart';
import 'package:search_application/view/screens/detailsScreen.dart';
import 'package:search_application/view/screens/searchListingScreen.dart';
import 'package:search_application/view/screens/splashScreen.dart';
import 'package:search_application/view_model/bindings/splashBinding.dart';

class AppPages {
  static const initial = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: Routes.searchListingScreen,
      page: () => const SearchListingScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: Routes.detailsScreen,
      page: () => const DetailsScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1000),
    ),
  ];
}

//static routes
abstract class Routes {
  static const splashScreen = '/splashScreen';
  static const searchListingScreen = '/searchListingScreen';
  static const detailsScreen = '/detailsScreen';
}
