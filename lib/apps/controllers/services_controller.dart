import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:recuchapadmin/apps/models/services_model.dart';

class ServicesController extends GetxController {
  final id = 0.obs;
  final price = 0.0.obs;
  final duration = 0.obs;
  final title = ''.obs;
  final description = ''.obs;
  final createdat = ''.obs;
  final updatedat = ''.obs;
  final inprogresss = 'ACTIVE'.obs;

  final priceTC = TextEditingController();
  final durationTC = TextEditingController();
  final titleTC = TextEditingController();
  final descriptionTC = TextEditingController();
  final createdatTC = TextEditingController();
  final updatedatTC = TextEditingController();
  final inprogressTC = TextEditingController();

  var cardKeys = [].obs;
  final editId = 0.obs;
  final isupdating = false.obs;

  final servicesList = <ServicesModel>[
    ServicesModel(
        id: 1,
        title: 'title1',
        price: 1100,
        duration: 10,
        createdat: '01-01-2021',
        updatedat: '01-01-2021',
        inprogresss: 'ACTIVE',
        description: 'bla blabla bla'),
    ServicesModel(
        id: 2,
        title: 'title2',
        price: 2200,
        duration: 20,
        createdat: '02-02-2021',
        updatedat: '02-02-2021',
        inprogresss: 'ACTIVE',
        description: 'bla blabla bla'),
    ServicesModel(
        id: 3,
        title: 'title3',
        price: 3300,
        duration: 30,
        createdat: '03-03-2021',
        updatedat: '03-03-2021',
        inprogresss: 'ACTIVE',
        description: 'bla blabla bla'),
    ServicesModel(
        id: 4,
        title: 'title4',
        price: 4400,
        duration: 40,
        createdat: '04-04-2021',
        updatedat: '04-04-2021',
        inprogresss: 'ACTIVE',
        description: 'bla blabla bla'),
    ServicesModel(
        id: 5,
        title: 'title5',
        price: 5500,
        duration: 50,
        createdat: '05-05-2021',
        updatedat: '05-05-2021',
        inprogresss: 'ACTIVE',
        description: 'bla blabla bla'),
  ].obs;

  /// create keys for `expansion tiles card`
  createKeys() {
    cardKeys.value = [];
    for (var i = 0; i < servicesList.length; i++) {
      cardKeys.add(GlobalKey<ExpansionTileCardState>());
    }
  }

  addService() {
    servicesList.add(
      ServicesModel(
        id: servicesList.length + 1,
        title: titleTC.text,
        price: double.parse(priceTC.text),
        duration: int.parse(durationTC.text),
        description: descriptionTC.text,
        createdat: DateTime.now().toString().substring(0, 10),
        updatedat: DateTime.now().toString().substring(0, 10),
        inprogresss: inprogresss.value,
      ),
    );
    createKeys();
  }

  updateService() {
    servicesList.insert(
        servicesList.indexWhere((element) => editId.value == element.id),
        ServicesModel(
          id: editId.value,
          title: titleTC.text,
          price: double.parse(priceTC.text),
          duration: int.parse(durationTC.text),
          description: descriptionTC.text,
          updatedat: DateTime.now().toString().substring(0, 10),
          inprogresss: inprogresss.value,
        ));
    createKeys();
  }

  deleteService(int index) {
    servicesList
        .removeAt(servicesList.indexWhere((element) => element.id == index));
    createKeys();
  }

  clearTC() {
    priceTC.text = '';
    durationTC.text = '';
    titleTC.text = '';
    descriptionTC.text = '';
    createdatTC.text = '';
    updatedatTC.text = '';
    inprogressTC.text = '';
  }

  @override
  void onInit() {
    createKeys();
    super.onInit();
  }
}
