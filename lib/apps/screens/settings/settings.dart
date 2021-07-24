import 'package:flutter/material.dart';
import 'package:recuchapadmin/apps/routes/route_names.dart';

import '../../../main.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: Routes.SETTINGS,
      body: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        child: Text(
          'Settings',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 36, color: Colors.amber),
        ),
      ),
    );
  }
}
