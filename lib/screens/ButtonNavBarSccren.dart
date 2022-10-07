import 'package:covid_19/config/pallet.dart';
import 'package:covid_19/screens/StaticScreen.dart';
import 'package:covid_19/screens/StatusScrren.dart';
import 'package:covid_19/screens/widgets/SimpleChart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ButtonNavBarSccren extends StatefulWidget {
  ButtonNavBarSccren({Key? key}) : super(key: key);

  @override
  State<ButtonNavBarSccren> createState() => _ButtonNavBarSccrenState();
}

class _ButtonNavBarSccrenState extends State<ButtonNavBarSccren> {
  int _currentIndex = 0;
  List<Widget> _screens = [
    StatusScrren(),
    StaticScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // _currentIndex = 2;
    //_screens[_currentIndex];
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              print(index);
              _currentIndex = index;
              print(_currentIndex);
            });
          },
          elevation: 0.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: [Icons.home, Icons.insert_chart]
              .asMap()
              .map((key, value) {
                return MapEntry(
                    key,
                    BottomNavigationBarItem(
                        label: '',
                        icon: Container(
                          decoration: BoxDecoration(
                              color: _currentIndex == key
                                  ? Palette.colorPallet
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 16.0),
                          child: Icon(value),
                        )));
              })
              .values
              .toList()),
    );
  }
}
