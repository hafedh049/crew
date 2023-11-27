import 'package:crew/generate.dart';
import 'package:crew/history.dart';
import 'package:crew/owner.dart';
import 'package:crew/scan.dart';
import 'package:flutter/material.dart';

const Color teal = Colors.tealAccent;
const Color grey = Colors.grey;
const Color white = Colors.white;

final List<Map<String, dynamic>> screens = <Map<String, dynamic>>[
  <String, dynamic>{"screen": const Scan()},
  <String, dynamic>{"screen": const Generate()},
  <String, dynamic>{"screen": const Owner()},
  <String, dynamic>{"screen": const History()},
];

int currentIndex = 0;
