import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covid_19/config/pallet.dart';
import 'package:covid_19/data/data.dart';
import 'package:covid_19/screens/StatusScrren.dart';
import 'package:covid_19/screens/widgets/SimpleChart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StaticScreen extends StatefulWidget {
  StaticScreen({Key? key}) : super(key: key);

  @override
  State<StaticScreen> createState() => _StaticScreenState();
}

class _StaticScreenState extends State<StaticScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.colorPallet,
      appBar: CusttomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _GetStaticHead(),
          _buldTabs(),
          _dayesTabController(),
          _DashBoardedBoxes(height),
          _ChartSection(),
        ],
      ),
    );
  }
}

AppBar CusttomAppBar() {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Palette.colorPallet,
    leading: IconButton(
      onPressed: () {},
      icon: Icon(Icons.menu),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.browse_gallery),
      ),
    ],
  );
}

_GetStaticHead() {
  return SliverToBoxAdapter(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Text(
        'Statitisc',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

_buldTabs() {
  return SliverToBoxAdapter(
    child: DefaultTabController(
      length: 2,
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white54,
        ),
        child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40,
              indicatorColor: Colors.white,
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: [Text('My Countery'), Text('Global')]),
      ),
    ),
  );
}

_dayesTabController() {
  return SliverToBoxAdapter(
    child: DefaultTabController(
        length: 3,
        child: Container(
          padding: EdgeInsets.all(10),
          child: TabBar(
              indicatorColor: Colors.transparent,
              tabs: [Text('ToDay'), Text('Week'), Text('Month')]),
        )),
  );
}

_DashBoardedBoxes(height) {
  return SliverToBoxAdapter(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      height: height * .3,
      child: Column(children: [
        Flexible(
            child: Row(
          children: [
            GetExpanednCol('Easy', '1 M', Colors.blue[200]),
            GetExpanednCol('Dangers', '9 k', Colors.red[200])
          ],
        )),
        Flexible(
            child: Row(
          children: [
            GetExpanednCol(
                'IN Stock', '6 K', Color.fromARGB(255, 246, 89, 155)),
            GetExpanednCol('Prepear', '10 M', Colors.yellow[200]),
            GetExpanednCol('Fixed', '3 M', Colors.green[200])
          ],
        ))
      ]),
    ),
  );
}

Expanded GetExpanednCol(String text, String value, color) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(text,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ]),
    ),
  );
}

_ChartSection() {
  List chartData = ["21", "123", "23", '23'];
  return SliverToBoxAdapter(
    child: Container(
      height: 200,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Daily Statsic',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ]),
      // sing Viutions 
    ),
  );
}
