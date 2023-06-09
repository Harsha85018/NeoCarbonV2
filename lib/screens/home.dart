import 'package:decarbonus/screens/bottombar/blogs.dart';
import 'package:decarbonus/screens/dailyactivity.dart';
import 'package:decarbonus/screens/overallactivity.dart';
import 'package:decarbonus/screens/projects.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/fade_animation.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    BlogList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25),
      ChartData('Steve', 38),
      ChartData('Jack', 34),
      ChartData('Others', 52)
    ];
    return Scaffold(
      body: FadeAnimation(
        delay: 0,
        fadeDirection: FadeDirection.right,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4.sp,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SfCircularChart(
                      palette: const <Color>[
                        Colors.green,
                        Colors.lightGreen,
                        Colors.greenAccent,
                        Colors.lightGreenAccent,
                      ],
                      series: <CircularSeries>[
                        RadialBarSeries<ChartData, String>(
                            useSeriesColor: true,
                            radius: '140',
                            trackOpacity: 0.3,
                            cornerStyle: CornerStyle.bothCurve,
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Text("Carbon Emission Data"),
                            Text("56"),
                          ],
                        ),
                        Column(
                          children: const [
                            Text("Travel"),
                            Text("24"),
                          ],
                        ),
                        Column(
                          children: const [
                            Text("Overall"),
                            Text("90"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              const Text(
                "Tracks",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const DailyActivityScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10.sp),
                  width: MediaQuery.of(context).size.width * 0.9.sp,
                  height: MediaQuery.of(context).size.height * 0.05.sp,
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent.shade100,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.sp),
                    ),
                  ),
                  child: const Center(child: Text("Daily Activity")),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          const OverallActivityScreen(overallEmissions: 700),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10.sp),
                  width: MediaQuery.of(context).size.width * 0.9.sp,
                  height: MediaQuery.of(context).size.height * 0.05.sp,
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent.shade100,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.sp),
                    ),
                  ),
                  child: const Center(child: Text("Overall Activity")),
                ),
              ),
              SizedBox(
                height: 35.sp,
                child: Divider(
                  color: Colors.black,
                  indent: 40.sp,
                  endIndent: 40.sp,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const ProjectsScreen(),
                    ),
                  );
                },
                child: Text(
                  "Start Off-setting",
                  style: TextStyle(
                      fontSize: 18.sp, color: Colors.lightGreen.shade900),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
