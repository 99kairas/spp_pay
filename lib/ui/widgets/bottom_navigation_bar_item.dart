import 'package:flutter/material.dart';

BottomNavigationBarItem bottomNavBarWidget({
  required String image,
  Color? color,
  required String label,
}) {
  return BottomNavigationBarItem(
    icon: Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(bottom: 3.49),
      child: Image.asset(
        image,
        color: color,
      ),
    ),
    label: label,
  );
}
