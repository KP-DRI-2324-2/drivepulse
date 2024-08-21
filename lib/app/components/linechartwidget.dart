import 'package:flutter/material.dart';
import 'package:drivepulse/app/common/theme/colors.dart';
import 'package:drivepulse/app/common/theme/fonts.dart';
import 'package:drivepulse/app/data/data_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../data/model/chartdata_model.dart';

class SeparatedChart extends StatelessWidget {
  const SeparatedChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Air Temperature',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SfCartesianChart(
            legend: const Legend(isVisible: false),
            series: getSeperatedData(),
            selectionType: SelectionType.series,
            trackballBehavior: TrackballBehavior(
              shouldAlwaysShow: true,
              activationMode: ActivationMode.longPress,
              enable: true,
              tooltipSettings: const InteractiveTooltip(enable: true),
            ),
            primaryXAxis: CategoryAxis(
              interval: 1,
              majorGridLines: const MajorGridLines(width: 0),
              axisLine: AxisLine(color: kColorScheme.primary, width: 0.0),
              isVisible: false,
            ),
            primaryYAxis: NumericAxis(
              labelStyle: mediumText12,
              majorGridLines: const MajorGridLines(width: 0),
              axisLine: AxisLine(color: kColorScheme.primary, width: 0.0),
            ),
            enableAxisAnimation: true,
            zoomPanBehavior: ZoomPanBehavior(
              enableMouseWheelZooming: true,
              enablePinching: true,
              zoomMode: ZoomMode.xy,
              enablePanning: true,
            ),
            enableSideBySideSeriesPlacement: true,
            crosshairBehavior: CrosshairBehavior(
                enable: true, activationMode: ActivationMode.singleTap),
            borderColor: kColorScheme.primary,
            onCrosshairPositionChanging: (c) {
              // TODO:- show value changing in text field
            },
            borderWidth: 0,
            plotAreaBorderWidth: 0,
            tooltipBehavior: TooltipBehavior(enable: true),
          ),
        ],
      ),
    );
  }

  List<CartesianSeries<ChartData, String>> getSeperatedData() {
    List<ChartData> getChartData() {
      List<ChartData> chartData = [];

      dataList1.validate().asMap().forEach((key, value) {
        chartData.add(ChartData(value[0].toString(), double.parse(value[1])));
      });

      return chartData;
    }

    return <CartesianSeries<ChartData, String>>[
      SplineAreaSeries<ChartData, String>(
        dataSource: getChartData(),
        enableTooltip: true,
        isVisibleInLegend: false,
        borderWidth: 1.5,
        dataLabelSettings: const DataLabelSettings(),
        splineType: SplineType.clamped,
        color: Colors.red,
        borderColor: Colors.red,
        animationDuration: 1000,
        opacity: 0.3,
        xValueMapper: (ChartData data, _) => '${data.key}',
        yValueMapper: (ChartData data, _) => data.value,
        legendIconType: LegendIconType.triangle,
        legendItemText: '',
        emptyPointSettings:
            const EmptyPointSettings(mode: EmptyPointMode.average),
      ),
    ];
  }
}

class CombinedChart extends StatelessWidget {
  const CombinedChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: SfCartesianChart(
        legend: const Legend(isVisible: true),
        series: getCombinedData(),
        selectionType: SelectionType.series,
        trackballBehavior: TrackballBehavior(
          shouldAlwaysShow: true,
          activationMode: ActivationMode.longPress,
          enable: true,
          tooltipSettings: const InteractiveTooltip(enable: true),
        ),
        primaryXAxis: CategoryAxis(
          interval: 1,
          majorGridLines: const MajorGridLines(width: 0),
          axisLine: AxisLine(color: kColorScheme.primary, width: 0.0),
          isVisible: false,
        ),
        primaryYAxis: NumericAxis(
          labelStyle: mediumText12,
          majorGridLines: const MajorGridLines(width: 0),
          axisLine: AxisLine(color: kColorScheme.primary, width: 0.0),
        ),
        enableAxisAnimation: true,
        zoomPanBehavior: ZoomPanBehavior(
          enableMouseWheelZooming: true,
          enablePinching: true,
          zoomMode: ZoomMode.xy,
          enablePanning: true,
        ),
        enableSideBySideSeriesPlacement: true,
        crosshairBehavior: CrosshairBehavior(
            enable: true, activationMode: ActivationMode.singleTap),
        borderColor: kColorScheme.primary,
        onCrosshairPositionChanging: (c) {
          // TODO:- show value changing in text field
        },
        borderWidth: 0,
        plotAreaBorderWidth: 0,
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  List<CartesianSeries<ChartData, String>> getCombinedData() {
    List<ChartData> getChartData1() {
      List<ChartData> chartData = [];

      dataList1.validate().asMap().forEach((key, value) {
        if (value.length > 1) {
          chartData.add(
            ChartData(
              value[0].toString(),
              double.tryParse(value[1]) ?? 0.0,
            ),
          );
        }
      });

      return chartData;
    }

    List<ChartData> getChartData2() {
      List<ChartData> chartData = [];

      dataList2.validate().asMap().forEach((key, value) {
        if (value.length > 1) {
          chartData.add(
            ChartData(
              value[0].toString(),
              double.tryParse(value[1]) ?? 0.0,
            ),
          );
        }
      });

      return chartData;
    }

    return <CartesianSeries<ChartData, String>>[
      SplineSeries<ChartData, String>(
        dataSource: getChartData1(),
        enableTooltip: true,
        dataLabelSettings: const DataLabelSettings(),
        color: kColorScheme.primary,
        animationDuration: 1000,
        xValueMapper: (ChartData data, _) => data.key ?? '',
        yValueMapper: (ChartData data, _) => data.value ?? 0.0,
        legendIconType: LegendIconType.horizontalLine,
        legendItemText: '',
        emptyPointSettings:
            const EmptyPointSettings(mode: EmptyPointMode.average),
      ),
      SplineSeries<ChartData, String>(
        dataSource: getChartData2(),
        enableTooltip: true,
        dataLabelSettings: const DataLabelSettings(),
        color: Colors.red,
        animationDuration: 1000,
        xValueMapper: (ChartData data, _) => data.key ?? '',
        yValueMapper: (ChartData data, _) => data.value ?? 0.0,
        legendIconType: LegendIconType.horizontalLine,
        legendItemText: '',
        emptyPointSettings:
            const EmptyPointSettings(mode: EmptyPointMode.average),
      ),
    ];
  }
}

Widget linechartwidget({required bool isSeparated}) {
  if (isSeparated) {
    return const SeparatedChart();
  } else {
    return const CombinedChart();
  }
}
