import '/Module/Authentication/Views/splash.dart';
import '../Module/Dashboard/Views/dashboard_view.dart';
import 'package:get/get.dart';

class AppRoues {
  static String splash = "/";
  static String dashboard = "/dashboard";

  static getSpashRout() => splash;
  static getDashboardRout() => dashboard;

  // static List<GetPage> routes = [
  //   GetPage(name: ()=> Splash(), page: splash),
  //   GetPage(name: ()=>Dashboard(), page: dashboard),
  // ];
}
