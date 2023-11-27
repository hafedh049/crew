import 'package:crew/generate.dart';
import 'package:crew/history.dart';
import 'package:crew/scan.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const Color pink = Colors.pinkAccent;
const Color grey = Color.fromARGB(255, 51, 56, 66);
const Color white = Colors.white;
const Color transparent = Colors.transparent;

const List<Widget> screens = <Widget>[
  Scan(),
  Generate(),
  Owner(),
  History(),
];

int currentIndex = 0;
Box? box;
