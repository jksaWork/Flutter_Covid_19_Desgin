import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  final List contaries;
  final String contry;
  final Function method;
  CustomDropDownMenu(
      {Key? key,
      required this.contaries,
      required this.contry,
      required this.method});
  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
      child: Text('jksa'),
    );
  }
}
