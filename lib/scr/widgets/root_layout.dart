import 'package:flutter/material.dart';

import '../router.dart' as router;
import 'package:go_router/go_router.dart' as go;

import '../shared/adaptive_navigation.dart';

class RootLayout extends StatelessWidget {
  const RootLayout({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex;
  static const _switcherKey = ValueKey('switcherKey');
  static const _navigationRailKey = ValueKey('navigationRailKey');

  @override
  Widget build(BuildContext context) {
    void onSelected(int index) {
      final destination = router.destinations[index];
      go.GoRouter.of(context).go(destination.route);
    }

    return Container();

    // AdaptiveNavigation(
    //   key: _navigationRailKey,
    //   destinations: router
    //       .map((e) => NavigationDestination(
    //             icon: e.icon,
    //             label: e.label,
    //           ))
    //       .toList(),
    //   selectedIndex: currentIndex,
    //   onDestinationSelected: onSelected,
    //   child: Column(
    //     children: [
    //       Expanded(
    //         child: _Switcher(
    //           key: _switcherKey,
    //           child: child,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

// class _Switcher extends StatelessWidget {
//   final Widget child;

//   const _Switcher({
//     required this.child,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return UniversalPlatform.isDesktop
//         ? child
//         : AnimatedSwitcher(
//             key: key,
//             duration: const Duration(milliseconds: 200),
//             switchInCurve: Curves.easeInOut,
//             switchOutCurve: Curves.easeInOut,
//             child: child,
//           );
//   }
// }
