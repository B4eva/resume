import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/models/language.dart';
import 'package:resume/outils/extensions.dart';
import 'package:resume/scr/app.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/app_sizes.dart';
import '../../outils/shared_preference.dart';

import '../widgets/social_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final translation = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
            title: Text(
          translation.settingsText,
          style: context.bodySmall!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(translation.languageText),
                DropdownButton<Language>(
                  underline: const SizedBox(),
                  icon: const Icon(
                    Icons.language,
                    color: Colors.blue,
                  ),
                  onChanged: (
                    Language? language,
                  ) async {
                    if (language != null) {
                      MyApp.setLocale(
                          context, Locale(language.languageCode, ''));

                      print('translation');
                    }
                  },
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(e.flag),
                              Text(e.name),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(translation.darkModeText),
                Checkbox(
                    value: themeChange.darkTheme,
                    onChanged: (bool? value) {
                      themeChange.darkTheme = value!;
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(translation.shareText),
                const Icon(Icons.share),
              ],
            ),
            gapH12,
            Visibility(
              visible: true,
              child: SocialAuthContainer(
                instagramPress: () {
                  launchUrl(Uri.parse('https://instagram.com/efuetbright/'));
                },
                onTwitterPress: () {
                  launchUrl(
                      Uri.parse('  https://web.facebook.com/bright.efuet'));
                },
                onFacebookPress: () {
                  launchUrl(Uri.parse('https://twitter.com/b4_eva'));
                },
              ),
            ),
          ]),
        ));
  }
}
