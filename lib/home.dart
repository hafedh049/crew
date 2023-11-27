import 'package:crew/utils/globals.dart';
import 'package:crew/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive/hive.dart';
import 'package:icons_plus/icons_plus.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _screensController = PageController();

  @override
  void dispose() {
    _screensController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        tabMargin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        rippleColor: Colors.grey.shade700,
        hoverColor: Colors.grey.shade800,
        haptic: true,
        tabBorderRadius: 5,
        curve: Curves.linear,
        duration: 500.ms,
        color: white,
        activeColor: Colors.black,
        iconSize: 20,
        tabBackgroundColor: pink,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tabs: <GButton>[
          GButton(
            icon: Bootstrap.qr_code_scan,
            text: ' Scan',
            onPressed: () {
              currentIndex = 0;
              _screensController.jumpToPage(currentIndex);
            },
          ),
          GButton(
            icon: FontAwesome.cubes,
            text: ' Generate',
            onPressed: () {
              currentIndex = 1;
              _screensController.jumpToPage(currentIndex);
            },
          ),
          GButton(
            icon: FontAwesome.user,
            text: ' Owner',
            onPressed: () {
              currentIndex = 2;
              _screensController.jumpToPage(currentIndex);
            },
          ),
          GButton(
            icon: Bootstrap.clock_history,
            text: ' History',
            onPressed: () {
              currentIndex = 3;
              _screensController.jumpToPage(currentIndex);
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.only(top: 36, left: 16, right: 16, bottom: 16),
          child: FutureBuilder<Box>(
            future: load(),
            builder: (BuildContext context, AsyncSnapshot<Box> snapshot) {
              if (snapshot.hasData) {
                box = snapshot.data!;
                return PageView.builder(
                  itemCount: 4,
                  controller: _screensController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (int index) => currentIndex = index,
                  itemBuilder: (BuildContext context, int index) => screens[index]["screen"],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: pink));
              } else {
                return Center(child: Text(snapshot.error.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: pink)));
              }
            },
          ),
        ),
      ),
    );
  }
}
