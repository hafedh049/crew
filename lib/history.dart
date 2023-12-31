import 'package:clipboard/clipboard.dart';
import 'package:crew/utils/globals.dart';
import 'package:crew/utils/methods.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:icons_plus/icons_plus.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final List? _data = box!.get("data");
  @override
  Widget build(BuildContext context) {
    return _data == null || _data.isEmpty
        ? const Center(child: Text("NO SCANS YET.", style: TextStyle(color: pink, fontSize: 16, fontWeight: FontWeight.w500)))
        : ListView.builder(
            itemCount: _data.length,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return Tilt(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(color: grey, boxShadow: <BoxShadow>[BoxShadow(color: pink, blurStyle: BlurStyle.outer, offset: Offset(2, 2))]),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(color: grey, boxShadow: <BoxShadow>[BoxShadow(color: pink, blurStyle: BlurStyle.outer, offset: Offset(2, 2))]),
                                child: const Text("Content", style: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(width: 10),
                              Flexible(child: Text(_data[index]["text"], style: const TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w300))),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(color: grey, boxShadow: <BoxShadow>[BoxShadow(color: pink, blurStyle: BlurStyle.outer, offset: Offset(2, 2))]),
                                child: const Text("Date", style: TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(width: 10),
                              Flexible(child: Text(formatDate(_data[index]["date"], [yyyy, '-', mm, '-', dd, ', ', hh, ':', nn, ' ', am]), style: const TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w300))),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            onPressed: () async => await FlutterClipboard.copy(_data[index]["text"]).then((value) => showSnack("Copied To Clipboard", context)),
                            icon: const Icon(Bootstrap.clipboard2, size: 15, color: pink),
                          ),
                          IconButton(
                            onPressed: () async {
                              await box!.put("data", _data..removeAt(index));
                              setState(() {});
                              // ignore: use_build_context_synchronously
                              showSnack("Item Deleted Successfully", context);
                            },
                            icon: const Icon(Bootstrap.x_circle, size: 15, color: pink),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
