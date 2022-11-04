import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:resume/outils/themes.dart';
import 'package:resume/scr/feautures/profile/profile.dart';
import 'package:resume/scr/feautures/startup/startup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../outils/shared_preference.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(context, newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(BuildContext context, Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    final router =
        GoRouter(initialLocation: '/', debugLogDiagnostics: true, routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const StartUp(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileView(),
      ),
    ]);
    return ChangeNotifierProvider(
      create: (context) => themeChangeProvider,
      builder: ((context, child) {
        return Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              onGenerateTitle: (BuildContext context) => 'Resume',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: _locale,
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              themeMode: ThemeMode.dark,
              // routeInformationParser:
              //     router.routeInformationParser,
              // routerDelegate: router.routerDelegate,
            );
          },
        );
      }),
    );
  }
}
