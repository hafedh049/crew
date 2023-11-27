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
  rippleColor: Colors.grey.shade700, // tab button ripple color when pressed
  hoverColor: Colors.grey.shade800, // tab button hover color
  haptic: true, // haptic feedback
  tabBorderRadius: 15, 
  tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
  tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
  tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
  curve: Curves.easeOutExpo, // tab animation curves
  duration: Duration(milliseconds: 900), // tab animation duration
  gap: 8, // the tab button gap between icon and text 
  color: Colors.grey[800], // unselected icon color
  activeColor: Colors.purple, // selected icon and text color
  iconSize: 24, // tab button icon size
  tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
  tabs: [
    GButton(
      icon: Bootstrap.qr_code_scan,
      text: 'Home',
      onPressed: (){},
    ),
    GButton(
      icon: LineIcons.heart_o,
      text: 'Likes',
    ),
    GButton(
      icon: LineIcons.search,
      text: 'Search',
    ),
    GButton(
      icon: LineIcons.user,
      text: 'Profile',
    )
  ]
)
      body: const Column(
        children: <Widget>[],
      ),
    );
  }
}
