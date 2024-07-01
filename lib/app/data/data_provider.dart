import 'package:drivepulse/app/data/model/services_model.dart';
import 'package:drivepulse/app/modules/main/views/main_view.dart';
import 'package:flutter/material.dart';

List<ServicesModel> ServicesDataList() {
  List<ServicesModel> list = [];
  list.add(ServicesModel(
      title: 'Monitoring',
      icon: Icons.circle,
      image: "assets/images/logo-a.png",
      widget: MainView()));
  list.add(ServicesModel(
      title: 'Monitoring',
      icon: Icons.circle,
      image: "assets/images/logo-a.png",
      widget: MainView()));
  list.add(ServicesModel(
      title: 'Monitoring',
      icon: Icons.circle,
      image: "assets/images/logo-a.png",
      widget: MainView()));
  list.add(ServicesModel(
      title: 'Monitoring',
      icon: Icons.circle,
      image: "assets/images/logo-a.png",
      widget: MainView()));
  list.add(ServicesModel(
      title: 'Monitoring',
      icon: Icons.circle,
      image: "assets/images/logo-a.png",
      widget: MainView()));
  list.add(ServicesModel(
      title: 'Monitoring',
      icon: Icons.circle,
      image: "assets/images/logo-a.png",
      widget: MainView()));
  return list;
}
