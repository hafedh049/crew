import 'package:crew/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<State> _screensKey = GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        tabMargin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        rippleColor: grey.shade700,
        hoverColor: grey.shade800,
        haptic: true,
        tabBorderRadius: 5,
        curve: Curves.linear,
        duration: 500.ms,
        gap: 8,
        color: white,
        activeColor: Colors.black,
        iconSize: 25,
        tabBackgroundColor: teal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tabs: <GButton>[
          GButton(
            icon: Bootstrap.qr_code_scan,
            text: 'Scan',
            onPressed: () => _screensKey.currentState!.setState(() => currentIndex = 0),
          ),
          GButton(
            icon: FontAwesome.cubes,
            text: 'Generate',
            onPressed: () => _screensKey.currentState!.setState(() => currentIndex = 1),
          ),
          GButton(
            icon: FontAwesome.user,
            text: 'Owner',
            onPressed: () => _screensKey.currentState!.setState(() => currentIndex = 2),
          ),
          GButton(
            icon: Bootstrap.clock_history,
            text: 'History',
            onPressed: () => _screensKey.currentState!.setState(() => currentIndex = 3),
          )
        ],
      ),
      body: StatefulBuilder(
        key: _screensKey,
        builder: (BuildContext context, void Function(void Function()) _) {
          return PageView.builder(
            itemCount: 4,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (int index) => _(() => currentIndex = index),
            itemBuilder: (BuildContext context, int index) => screens[index]["screen"],
          );
        },
      ),
    );
  }
}
