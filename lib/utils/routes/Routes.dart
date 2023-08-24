import 'package:get/get.dart';
import 'package:mvvm/view/HomeScreen.dart';
import '../../view/LoginScreen.dart';

class RouteManager {
  static String loginScreen = '/loginScreen';
  static String getLoginScreen() => loginScreen;
  static String homeScreen = '/homeScreen';
  static String getHomeScreen() => homeScreen;

  static List<GetPage> routeList = [
    GetPage(
      name: loginScreen,
      page: () {
        return LoginScreen();
      },
    ),
    GetPage(
      name: homeScreen,
      page: () {
        return HomeScreen();
      },
    ),
  ];
}
