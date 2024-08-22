import 'package:drivepulse/app/common/theme/fonts.dart';
import 'package:drivepulse/app/common/theme/theme.dart';
import 'package:drivepulse/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DashboardView extends GetView<HomeController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: themeData.highlightColor,
          backgroundColor: themeData.primaryColor,
          title: Text(
            'Dashboard',
            style: boldText22.copyWith(color: themeData.highlightColor),
          ),
          bottom: TabBar(
            labelColor: themeData.highlightColor,
            unselectedLabelColor: themeData.highlightColor,
            indicatorColor: themeData.highlightColor,
            indicatorWeight: 5,
            tabs: const [
              Tab(text: 'Dashboard'),
              Tab(text: 'Analytics'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Speedometer
                  SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 150,
                        ranges: <GaugeRange>[
                          GaugeRange(
                              startValue: 0, endValue: 50, color: Colors.green),
                          GaugeRange(
                              startValue: 50,
                              endValue: 100,
                              color: Colors.orange),
                          GaugeRange(
                              startValue: 100,
                              endValue: 150,
                              color: Colors.red),
                        ],
                        pointers: const <GaugePointer>[
                          NeedlePointer(
                            value: 90,
                            enableAnimation: true,
                          ),
                        ],
                        annotations: const <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: Column(
                              children: [
                                Text(
                                  '90.0',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 90),
                                Icon(
                                  Icons.speed,
                                  size: 60,
                                ),
                              ],
                            ),
                            angle: 90,
                            positionFactor: 0.5,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Fuel Indicator
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              axisLineStyle: const AxisLineStyle(
                                thickness: 0.03,
                                thicknessUnit: GaugeSizeUnit.factor,
                                color: Colors.black,
                              ),
                              onLabelCreated: axisLabelCreated,
                              startAngle: 180,
                              endAngle: 0,
                              minorTickStyle: const MinorTickStyle(
                                  thickness: 2,
                                  color: Color.fromARGB(255, 143, 20, 2),
                                  length: 0.07,
                                  lengthUnit: GaugeSizeUnit.factor),
                              majorTickStyle: const MajorTickStyle(
                                  thickness: 2,
                                  color: Colors.red,
                                  length: 0.1,
                                  lengthUnit: GaugeSizeUnit.factor),
                              // ranges: <GaugeRange>[
                              //   GaugeRange(
                              //     startValue: 0,
                              //     endValue: 100,
                              //     gradient: const SweepGradient(colors: <Color>[
                              //       Color(0xffFE0702),
                              //       Color(0xffFFF500),
                              //       Color(0xffFFFFFF),
                              //       Color(0xff01DAFE),
                              //       Color(0xFF0110FE),
                              //     ], stops: <double>[
                              //       0.15,
                              //       0.30,
                              //       0.45,
                              //       0.75,
                              //       0.90
                              //     ]),
                              //   ),
                              // ],
                              pointers: const <GaugePointer>[
                                MarkerPointer(
                                  color: Colors.black,
                                  value: 50,
                                  enableAnimation: true,
                                  markerWidth: 15,
                                ),
                              ],
                              annotations: const <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Icon(Icons.local_gas_station),
                                  positionFactor: 0,
                                  verticalAlignment: GaugeAlignment.far,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Temperature
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              startAngle: 180,
                              endAngle: 0,
                              minimum: -60,
                              maximum: 60,
                              interval: 60,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                  startValue: -60,
                                  endValue: 60,
                                  gradient: const SweepGradient(colors: <Color>[
                                    Color(0xFF0110FE),
                                    Color(0xff01DAFE),
                                    Color(0xffFFFFFF),
                                    Color(0xffFFF500),
                                    Color(0xffFE0702),
                                  ], stops: <double>[
                                    0.15,
                                    0.30,
                                    0.45,
                                    0.75,
                                    0.90
                                  ]),
                                ),
                              ],
                              pointers: const <GaugePointer>[
                                MarkerPointer(
                                  color: Colors.black,
                                  value: 24,
                                  enableAnimation: true,
                                ),
                              ],
                              annotations: const <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Icon(Icons.thermostat),
                                  positionFactor: 0,
                                  verticalAlignment: GaugeAlignment.far,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Center(
              child: Text('Analytics Page'),
            ),
          ],
        ),
      ),
    );
  }
}

void axisLabelCreated(AxisLabelCreatedArgs args) {
  if (args.text == '100') {
    args.labelStyle = const GaugeTextStyle(
        color: Colors.blue,
        fontStyle: FontStyle.italic,
        fontFamily: 'Times',
        fontWeight: FontWeight.bold,
        fontSize: 15);
    args.canRotate = true;
    args.text = 'F';
  } else if (args.text == '0') {
    args.labelStyle = const GaugeTextStyle(
        color: Colors.red,
        fontStyle: FontStyle.italic,
        fontFamily: 'Times',
        fontWeight: FontWeight.bold,
        fontSize: 15);
    args.canRotate = false;
    args.text = 'E';
  }
}
