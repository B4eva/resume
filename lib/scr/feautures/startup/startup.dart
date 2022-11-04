import 'package:flutter/material.dart';
import 'package:resume/constants/app_sizes.dart';
import 'package:resume/outils/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../main/main_view.dart';

class StartUp extends StatelessWidget {
  const StartUp({super.key});

  @override
  Widget build(BuildContext context) {
    final translation = AppLocalizations.of(context)!;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 35, left: 35, right: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              gapH20,
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      translation.startUpTitleText,
                      style: context.bodySmall!.copyWith(fontSize: 16),
                    ),
                    Text(
                      translation.yourPowers,
                      style: context.bodySmall!.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ),
              gapH20,
              SizedBox(
                child: Stack(children: [
                  Positioned(
                      child: Image.asset(
                    'assets/images/pic.png',
                    fit: BoxFit.fill,
                  )),
                ]),
              ),
              Text(
                translation.doYouHave,
                style: context.bodySmall!.copyWith(
                  fontSize: 10,
                ),
              ),
              gapH20,
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainView()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        translation.continueText,
                        style: context.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              gapH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(translation.alreadyText,
                      style: context.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                  Text(translation.loginText,
                      style: context.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.blue[300]))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
