import 'package:crew/generate.dart';
import 'package:crew/history.dart';
import 'package:crew/scan.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const Color pink = Colors.pinkAccent;
const Color grey = Color.fromARGB(255, 51, 56, 66);
const Color white = Colors.white;
const Color transparent = Colors.transparent;

const List<Widget> screens = <Map<String, dynamic>>[
  <String, dynamic>{"screen": const Scan()},
  <String, dynamic>{"screen": const Generate()},
  <String, dynamic>{"screen": const Owner()},
  <String, dynamic>{"screen": const History()},
];

int currentIndex = 0;
Box? box;
