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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        tabMargin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        rippleColor: Colors.grey.shade700,
        hoverColor: Colors.grey.shade800,
        haptic: true,
        tabBorderRadius: 5,
        curve: Curves.linear,
        duration: 500.ms,
        gap: 8,
        color: white,
        activeColor: white,
        iconSize: 25,
        tabBackgroundColor: teal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tabs: <GButton>[
          GButton(
            icon: Bootstrap.qr_code_scan,
            text: 'Home',
            onPressed: () {},
          ),
          GButton(
            icon: FontAwesome.cubes,
            text: 'Likes',
            onPressed: () {},
          ),
          GButton(
            icon: FontAwesome.user,
            text: 'Search',
            onPressed: () {},
          ),
          GButton(
            icon: Bootstrap.clock_history,
            text: 'Profile',
            onPressed: () {},
          )
        ],
      ),
      body: const Column(
        children: <Widget>[],
      ),
    );
  }
}
