import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:recuchapadmin/apps/constants/apptitles.dart';
import 'package:recuchapadmin/apps/routes/route_names.dart';
import 'package:recuchapadmin/apps/screens/home/home.dart';
import 'package:recuchapadmin/apps/screens/profiles/profiles.dart';
import 'package:recuchapadmin/apps/screens/roles/roles.dart';
import 'package:recuchapadmin/apps/screens/services/services.dart';
import 'package:recuchapadmin/apps/screens/settings/settings.dart';
import 'package:recuchapadmin/apps/screens/subscriptions/subscriptions.dart';
import 'package:recuchapadmin/apps/screens/users/users.dart';

import 'apps/screens/dashboard/dashboard.dart';

void main() {
  runApp(Recuchapadmin());
}

class Recuchapadmin extends StatefulWidget {
  @override
  _RecuchapadminState createState() => _RecuchapadminState();
}

class _RecuchapadminState extends State<Recuchapadmin> {
  static const MaterialColor themeBlack = MaterialColor(
    _themeBlackPrimaryValue,
    <int, Color>{
      50: Color(_themeBlackPrimaryValue),
      100: Color(_themeBlackPrimaryValue),
      200: Color(_themeBlackPrimaryValue),
      300: Color(_themeBlackPrimaryValue),
      400: Color(_themeBlackPrimaryValue),
      500: Color(_themeBlackPrimaryValue),
      600: Color(_themeBlackPrimaryValue),
      700: Color(_themeBlackPrimaryValue),
      800: Color(_themeBlackPrimaryValue),
      900: Color(_themeBlackPrimaryValue),
    },
  );
  static const int _themeBlackPrimaryValue = 0xFF222222;
  static const Color themeTextPrimary = Color(0xFF9D9D9D);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RecuChapAdmin',
      theme: ThemeData(
        primarySwatch: themeBlack,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: themeBlack,
            ),
        primaryTextTheme: Theme.of(context).textTheme.apply(
              bodyColor: themeTextPrimary,
            ),
        primaryIconTheme: IconThemeData(
          color: themeTextPrimary,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) {
        final page = _getPageWidget(settings);
        if (page != null) {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => page,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(
                  opacity: anim,
                  child: child,
                );
              });
        }
        return null;
      },
    );
  }

  ///`Generate route for each page`
  Widget? _getPageWidget(RouteSettings settings) {
    if (settings.name == null) {
      return null;
    }
    final uri = Uri.parse(settings.name!);
    switch (uri.path) {
      case Routes.DASHBOARD:
        return DashboardPage();
      case Routes.USERS:
        return UsersPage();
      case Routes.SERVICES:
        return ServicesPage();
      case Routes.SUBSCRIPTIONS:
        return SubscriptionsPage();
      case Routes.ROLES:
        return RolesPage();
      case Routes.SETTINGS:
        return SettingsPage();
      case Routes.PROFILE:
        return ProfilesPage();
      case Routes.HOME:
        return HomePage();
    }
    return null;
  }
}

/// `This return the current page body`
class MyScaffold extends StatelessWidget {
  const MyScaffold({
    Key? key,
    required this.route,
    required this.body,
  }) : super(key: key);

  final Widget body;
  final String route;

  /// `The sidebar items display like drawer's items`
  final List<MenuItem> _sideBarItems = const [
    MenuItem(
      title: AppTitles.dashboard,
      route: Routes.DASHBOARD,
      icon: Icons.home_max,
    ),
    MenuItem(
      title: AppTitles.users,
      route: Routes.USERS,
      icon: Icons.group,
    ),
    MenuItem(
      title: AppTitles.subscriptions,
      route: Routes.SUBSCRIPTIONS,
      icon: Icons.shopping_cart,
    ),
    MenuItem(
      title: AppTitles.services,
      route: Routes.SERVICES,
      icon: Icons.featured_play_list_outlined,
    ),
    MenuItem(
      title: AppTitles.roles,
      route: Routes.ROLES,
      icon: Icons.security_outlined,
    ),
    MenuItem(
      title: AppTitles.profiles,
      route: Routes.PROFILE,
      icon: Icons.account_circle,
    ),
    MenuItem(
      title: AppTitles.settings,
      route: Routes.SETTINGS,
      icon: Icons.settings,
    ),
  ];

  /// `right side bar `
  final List<MenuItem> _adminMenuItems = const [
    MenuItem(
      title: 'Account',
      icon: Icons.account_circle,
      route: '/',
    ),
    MenuItem(
      title: 'Settings',
      icon: Icons.settings,
      route: '/',
    ),
    MenuItem(
      title: 'Logout',
      icon: Icons.logout,
      route: '/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('RecuChapAdmin'),
        actions: [
          PopupMenuButton<MenuItem>(
            child: const Icon(Icons.account_circle),
            itemBuilder: (context) {
              return _adminMenuItems.map((MenuItem item) {
                return PopupMenuItem<MenuItem>(
                  value: item,
                  child: Row(
                    children: [
                      Icon(item.icon),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList();
            },
            onSelected: (item) {
              //TODO
              print(
                  'actions: onSelected(): title = ${item.title}, route = ${item.route}');
              Navigator.of(context).pushNamed(item.route!);
            },
          ),
        ],
      ),
      sideBar: SideBar(
        backgroundColor: const Color(0xFFEEEEEE),
        activeBackgroundColor: Colors.black26,
        borderColor: const Color(0xFFE7E7E7),
        iconColor: Colors.black87,
        activeIconColor: Colors.blue,
        textStyle: const TextStyle(
          color: Color(0xFF337ab7),
          fontSize: 13,
        ),
        activeTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
        items: _sideBarItems,
        selectedRoute: route,
        onSelected: (item) {
          print(
              'sideBar: onTap(): title = ${item.title}, route = ${item.route}');
          if (item.route != null && item.route != route) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'header',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: body,
    );
  }
}
