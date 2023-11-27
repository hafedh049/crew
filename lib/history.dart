import 'package:crew/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';

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
        ? const Center(child: Text("NO SCANS YET.", style: TextStyle(color: grey, fontSize: 16, fontWeight: FontWeight.w500)))
        : ListView.builder(
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int index) {
              return Tilt(
                child: TiltParallax(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: grey, boxShadow: <BoxShadow>[BoxShadow(color: pink, blurStyle: BlurStyle.outer, offset: Offset(2, 2))]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(_data[index]["date"], style: const TextStyle(color: grey, fontSize: 14, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(color: grey, boxShadow: <BoxShadow>[BoxShadow(color: pink, blurStyle: BlurStyle.outer, offset: Offset(2, 2))]),
                              child: const Text("Date", style: TextStyle(color: grey, fontSize: 14, fontWeight: FontWeight.w500)),
                            ),
                            const SizedBox(width: 10),
                            Text(_data[index]["date"], style: const TextStyle(color: pink, fontSize: 14, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
