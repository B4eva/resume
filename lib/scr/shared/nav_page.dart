import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:resume/scr/feautures/profile/profile.dart';

import '../../constants/app_sizes.dart';
import '../settings/settings.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 3;
  final PageController _pageController = PageController();

  changeIndex(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  void onTapTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: kTabScrollDuration, curve: Curves.easeIn);
    });
  }

  final _destinations = <AdaptiveScaffoldDestination>[
    const AdaptiveScaffoldDestination(title: "Home", icon: Icons.dashboard),
    const AdaptiveScaffoldDestination(title: "Search", icon: Icons.search),
    const AdaptiveScaffoldDestination(title: "Message", icon: Icons.chat),
    const AdaptiveScaffoldDestination(title: "Profile", icon: Icons.person)
  ];

  final List<dynamic> _screens = <Widget>[
    Container(
      child: const Center(
        child: Text('HNG9'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('HNG9'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('HNG9'),
      ),
    ),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationScaffold(
      appBar: AppBar(
        title: const Text("Resume"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const SettingsView())));
            },
          ),
          gapW12,
        ],
      ),
      body: _screens[_selectedIndex],
      destinations: _destinations,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (value) {
        changeIndex(value);
      },
    );
  }
}
