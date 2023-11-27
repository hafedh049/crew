import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<Box> load() async {
  Hive.init((await getApplicationDocumentsDirectory()).path);
  return await Hive.openBox("qr");
}
