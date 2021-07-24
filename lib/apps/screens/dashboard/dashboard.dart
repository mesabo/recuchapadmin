import 'package:flutter/material.dart';
import 'package:recuchapadmin/apps/common/common_controllers.dart';
import 'package:recuchapadmin/apps/constants/appcolors.dart';
import 'package:recuchapadmin/apps/constants/appicons.dart';
import 'package:recuchapadmin/apps/constants/apptitles.dart';
import 'package:recuchapadmin/apps/routes/route_names.dart';
import 'package:recuchapadmin/apps/screens/dashboard/widgets/table_card.dart';
import 'package:recuchapadmin/apps/screens/dashboard/widgets/ticket_cards.dart';
import '../../../main.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: Routes.DASHBOARD,
      body: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        child: DashboardScreen(),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Column(
                children: [
                  MediaQuery.of(context).size.width < 1300
                      ? _ticketColumns(context)
                      : _ticketRows(context),
                  const SizedBox(
                    height: 16,
                  ),
                  //loading? //TODO
                  tableCard(context, commonserviceCTL.servicesList)
                  /*  : Center(
                          child: CircularProgressIndicator(),
                        ), */
                ],
              ),
            )
          ]),
        ),
      ],
    );
  }
}

Widget _ticketColumns(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Flexible(
          child:
              tickets(colors[0], context, icons[0], '13', AppTitles.profiles)),
      Flexible(
          child:
              tickets(colors[1], context, icons[1], '143', AppTitles.profiles)),
      Flexible(
          child:
              tickets(colors[2], context, icons[2], '16', AppTitles.profiles)),
      Flexible(
          child:
              tickets(colors[3], context, icons[3], '17', AppTitles.profiles)),
    ],
  );
}

Widget _ticketRows(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Flexible(
          child:
              tickets(colors[0], context, icons[0], '13', AppTitles.profiles)),
      Flexible(
          child:
              tickets(colors[1], context, icons[1], '143', AppTitles.profiles)),
      Flexible(
          child:
              tickets(colors[2], context, icons[2], '16', AppTitles.profiles)),
      Flexible(
          child:
              tickets(colors[3], context, icons[3], '17', AppTitles.profiles)),
    ],
  );
}
