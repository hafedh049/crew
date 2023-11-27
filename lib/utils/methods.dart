import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:crew/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<Box> load() async {
  Hive.init((await getApplicationDocumentsDirectory()).path);
  return await Hive.openBox("qr");
}

void showSnack(String msg, BuildContext context) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: transparent,
    content: AwesomeSnackbarContent(
      title: 'Snack!',
      message: msg,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.failure,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
