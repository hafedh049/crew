import 'package:crew/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final List? _data = box!.get("data");
  @override
  Widget build(BuildContext context) {
    return _data == null
        ? const Center(child: Text("NO SCANS YET.", style: const TextStyle(color: grey, fontSize: 16, fontWeight: FontWeight.w500)))
        : ListView.builder(
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int index) {},
          );
  }
}
