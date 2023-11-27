import 'package:crew/home.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(title: "Crew", theme: ThemeData.dark(), debugShowCheckedModeBanner: false, home: const Home());
}
