import 'package:crypto_app/widgets/balance_panel/profit_percentage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tuple/tuple.dart';

Padding chartHomePage(
  bool isHomePage,
  IconData cryptoIcon,
  String crypto,
  String cryptoCode,
  String exchangeCurrency,
  List<Tuple2> spots,
  ThemeData themeData,
) {
  // Rx<double> minY = 0.0.obs;
  // Rx<double> maxY = 0.0.obs;
  // List sortedSpots = spots.toList();
  // sortedSpots.sort((a, b) => a.item2.compareTo(b.item2));
  // minY.value = sortedSpots.first.item2;
  // maxY.value = sortedSpots.last.item2;
  double profitPercent = ((spots.last.item2 - spots[spots.length - 2].item2) /
          spots[spots.length - 2].item2) *
      100;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: 2.w,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        cryptoIcon,
                        size: 15.sp,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: SizedBox(
                          width: 50.w,
                          child: Text(
                            '$crypto ($cryptoCode)  - $exchangeCurrency',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Transform.scale(
                          child: profitPercentageWidget(profitPercent),
                          scale: 0.9),
                    ],
                  ),
                ),
                SizedBox(
                  width: 90.w,
                  height: 20.h,
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    //legend: Legend(isVisible: false),
                    //trackballBehavior: _trackballBehavior,
                    tooltipBehavior: TooltipBehavior(enable: true),
                    //title: ChartTitle(text: 'HPG'),
                    primaryXAxis: NumericAxis(
                      isVisible: false,
                      //majorGridLines: const MajorGridLines(width: 0),
                      //dateFormat: DateFormat.MMMd("vi"),
                      //interval: 3,
                      //minimum: DateTime(2016, 01, 01),
                      //maximum: DateTime(2017, 01, 01),
                    ),
                    primaryYAxis: NumericAxis(
                      //minimum: 70,
                        isVisible: false,

                        //rangePadding: ChartRangePadding.round,
                        //maximum: 130,
                        //interval: 20,
                        axisLine: const AxisLine(width: 0)),
                    axes: <ChartAxis>[
                      NumericAxis(
                          name: 'YAxis',
                          isVisible: false
                        // opposedPosition: true,
                        // majorGridLines: const MajorGridLines(width: 0),
                        // minimum: 0,
                        // maximum: 10,
                        // interval: 1)
                      )
                    ],
                    series: <ChartSeries<Tuple2, int>>[
                      // CandleSeries<ChartSampleData, DateTime>(
                      //     enableSolidCandles: true,
                      //     dataSource: getChartData(),
                      //     //trendlines: [Trendline(backwardForecast: 5)],
                      //     //opacity: 0.7,
                      //     xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
                      //     lowValueMapper: (ChartSampleData sales, _) => sales.low,
                      //     highValueMapper: (ChartSampleData sales, _) => sales.high,
                      //     openValueMapper: (ChartSampleData sales, _) => sales.open,
                      //     closeValueMapper: (ChartSampleData sales, _) => sales.close),
                      // ColumnSeries<ChartSampleData, DateTime>(
                      //     dataSource: getChartData(),
                      //     xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
                      //     yValueMapper: (ChartSampleData sales, _) => sales.volume!/100000000,
                      //     yAxisName: 'YAxis'),
                      SplineAreaSeries<Tuple2, int>(
                       // color: const Color.fromRGBO(192, 108, 132, 1),
                        color: const Color.fromRGBO(75, 135, 185, 0.6),
                        borderColor: const Color.fromRGBO(75, 135, 185, 1),
                        borderWidth: 10,
                        dataSource: spots,
                        xValueMapper: (Tuple2 data, _) => data.item1,
                        yValueMapper: (Tuple2 data, _) => data.item2,
                        // markerSettings: const MarkerSettings(isVisible: true),
                        // name: 'Exchange rate',
                        // trendlines: <Trendline>[
                        //   Trendline(
                        //       width: 3,
                        //       dashArray: <double>[10, 10],
                        //       name: 'Linear',
                        //
                        //       /// Here we mention the forward and backward forecast value.
                        //       forwardForecast: _forwardForecastValue,
                        //       backwardForecast: _backwardForecastValue)
                        // ]
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
