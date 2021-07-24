import 'package:get/get.dart';
import 'package:recuchapadmin/apps/routes/route_names.dart';
import 'package:recuchapadmin/apps/screens/dashboard/dashboard.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashboardPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => DashboardPage(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => DashboardPage(),
    ),
    GetPage(
      name: Routes.ROLES,
      page: () => DashboardPage(),
    ),
    GetPage(
      name: Routes.SERVICES,
      page: () => DashboardPage(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => DashboardPage(),
    ),
    GetPage(
      name: Routes.SUBSCRIPTIONS,
      page: () => DashboardPage(),
    ),
    GetPage(
      name: Routes.USERS,
      page: () => DashboardPage(),
    ),
  ];
}
