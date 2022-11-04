import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resume/scr/feautures/profile/profile.dart';
import 'package:resume/scr/settings/settings.dart';
import 'package:resume/scr/widgets/root_layout.dart';

import 'feautures/startup/startup.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

List<NavigationDestination> destinations = [
  const NavigationDestination(
    label: '/',
    icon: Icon(Icons.home), // Modify this line
    route: '/',
  ),
  const NavigationDestination(
    label: 'profile',
    icon: Icon(Icons.playlist_add_check), // Modify this line
    route: '/profile',
  ),
  const NavigationDestination(
    label: 'settings',
    icon: Icon(Icons.people), // Modify this line
    route: '/settings',
  ),
];

class NavigationDestination {
  const NavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Icon icon;
  final Widget? child;
}

final appRouter = GoRouter(
  routes: [
    // HomeScreen
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 0,
          child: StartUp(),
        ),
      ),
    ),

    // PlaylistHomeScreen
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 1,
          child: ProfileView(),
        ),
      ),
      routes: [
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: const RootLayout(
                key: _scaffoldKey, currentIndex: 1, child: SettingsView()),
          ),
        ),
      ],
    ),

    for (final route in destinations.skip(3))
      GoRoute(
        path: route.route,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: destinations.indexOf(route),
            child: const SizedBox(),
          ),
        ),
      ),
  ],
);
