import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> load() async {
  await Hive.init((await getApplicationDocumentsDirectory()).path);
}
