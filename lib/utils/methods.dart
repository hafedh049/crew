import 'package:crew/utils/globals.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> load() async {
  Hive.init((await getApplicationDocumentsDirectory()).path);
  box = await Hive.openBox("qr");
}
