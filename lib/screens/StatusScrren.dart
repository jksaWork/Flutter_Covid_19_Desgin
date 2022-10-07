import 'package:covid_19/config/pallet.dart';
import 'package:covid_19/data/data.dart';
import 'package:covid_19/screens/widgets/CustomDropDownMenu.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class StatusScrren extends StatelessWidget {
  const StatusScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CusttomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _bulidHeader(ScreenHeight),
          _PreventionsTips(),
          _grdiantBackground(ScreenHeight),
        ],
      ),
    );
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
}

SliverToBoxAdapter _bulidHeader(double hieght) {
  return SliverToBoxAdapter(
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Palette.colorPallet,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Covid-19',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            CustomDropDownMenu(
                contaries: ['Sud', 'Egy', 'Fra'],
                contry: 'Sud',
                method: (val) {
                  print(val);
                }),
          ]),
          SizedBox(
            height: 10,
          ),
          Text(
            'In this article, we will',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'In various properties of it in flutter. We will use the Flutter DropDownButton widget to display',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton.icon(
                  color: Colors.red[100],
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  icon: Icon(Icons.phone),
                  label: Text('call Phone')),
              FlatButton.icon(
                  color: Colors.blue[100],
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  icon: Icon(Icons.bubble_chart),
                  label: Text('Send APi')),
            ],
          )
        ],
      ),
    ),
  );
}

_PreventionsTips() {
  List PrevintionData = [
    {'wash hands': 'assets/images/1.png'},
    {'Clear Table': 'assets/images/3.png'},
    {'Call Hear': 'assets/images/2.png'},
  ];
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorate Tips',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          FutureBuilder(
              future: _getVans(),
              builder: (context, tipsSnap) {
                print(tipsSnap);
                if (tipsSnap.connectionState == ConnectionState.none &&
                    tipsSnap.hasData == null) {
                  //print('project snapshot data is: ${projectSnap.data}');
                  return CircularProgressIndicator();
                }
                return CircularProgressIndicator();
              }),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: PrevintionData.map((e) => Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              e.values.first,
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              e.keys.first,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ]),
                    )).toList()),
          ),
        ],
      ),
    ),
  );
}

_grdiantBackground(height) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        height: height * .2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Palette.colorPallet,
                Color.fromARGB(255, 141, 131, 249),
              ],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hello Gradient!',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'We will use the Flutter DropDownButton widget to display',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    ),
  );
}
