import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        tabs: <GButton>[
          GButton(
            icon: Bootstrap.qr_code,
            active: true,
            haptic: true,
            onPressed: () {},
          ),
          GButton(
            icon: FontAwesome.cubes,
            active: true,
            haptic: true,
            onPressed: () {},
          ),
          GButton(
            icon: FontAwesome.user_astronaut,
            active: true,
            haptic: true,
            onPressed: () {},
          ),
          GButton(
            icon: Bootstrap.clock_history,
            active: true,
            haptic: true,
            onPressed: () {},
          ),
        ],
      ),
      body: const Column(
        children: <Widget>[],
      ),
    );
  }
}
