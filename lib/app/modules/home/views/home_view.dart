import 'package:drivepulse/app/common/theme/fonts.dart';
import 'package:drivepulse/app/data/data_provider.dart';
import 'package:drivepulse/app/data/model/services_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  List<ServicesModel> data = ServicesDataList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBF0000),
        title: Text(
          'Vehicle Registration',
          style: boldText22.copyWith(color: Colors.white),
        ),
        centerTitle: false,
        actions: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              side: const BorderSide(
                width: 3,
                color: Colors.white,
              ),
              backgroundColor: const Color(0xFFBF0000),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
            child: Text(
              "Connection",
              style: boldText14.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          // Top Component
          Stack(
            children: [
              Container(
                height: 180,
                margin: const EdgeInsets.only(bottom: 16.0),
                decoration: boxDecorationWithRoundedCorners(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.6],
                    colors: [
                      Color(0xFFBF0000),
                      Color(0xFF590000),
                    ],
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 80.0),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16.0, left: 16.0),
                transform: Matrix4.translationValues(0, 16.0, 0),
                alignment: Alignment.center,
                decoration: boxDecorationRoundedWithShadow(12,
                    backgroundColor: context.cardColor),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 8.0,
                  children: data.map(
                    (e) {
                      return Container(
                        constraints: BoxConstraints(
                            minWidth: MediaQuery.sizeOf(context).width * 0.25),
                        padding: const EdgeInsets.only(top: 20, bottom: 20.0),
                        child: Column(
                          children: [
                            Image.asset(e.image!,
                                width: 28, height: 28, fit: BoxFit.fill),
                            8.height,
                            Text(e.title.toString(),
                                style: boldTextStyle(size: 12),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ).onTap(
                        () {
                          e.widget.launch(context);
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
          // Bottom Component
          Container(
            margin: const EdgeInsets.only(right: 16.0, left: 16.0),
            transform: Matrix4.translationValues(0, 16.0, 0),
            alignment: Alignment.center,
            decoration: boxDecorationRoundedWithShadow(12,
                backgroundColor: Colors.grey),
            child: const SizedBox(
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
