import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget tickets(Color color, BuildContext context, IconData icon,
    String ticketsNumber, String newCount) {
  return Card(
    elevation: 2,
    child: Container(
      padding: const EdgeInsets.all(22),
      color: color,
      width: MediaQuery.of(context).size.width < 1300
          ? double.infinity
          : MediaQuery.of(context).size.width / 5.5,
      height: Get.height / 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                icon,
                size: 36,
                color: Colors.white,
              ),
              const Text(
                "View Details",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                ticketsNumber,
                style: const TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                newCount,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
