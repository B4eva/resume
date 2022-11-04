import 'package:flutter/material.dart';
import 'package:resume/constants/app_sizes.dart';
import 'package:resume/outils/extensions.dart';
import 'package:resume/scr/settings/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final translation = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
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
      body: const MainBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.white,
        elevation: 20,
        // selectedItemColor: Colors.blue,

        showUnselectedLabels: true,
        iconSize: 30,
        showSelectedLabels: true,
        selectedFontSize: 20,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            print(currentIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.dashboard), label: translation.homebtn),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search), label: translation.searchbtn),
          BottomNavigationBarItem(
              icon: const Icon(Icons.chat_bubble),
              label: translation.messagebtn),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person), label: translation.profilebtn),
        ],
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    final translation = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 20,
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'assets/images/person.jpg',
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('EFUETBEJA BRIGHT T.',
                          style: context.bodySmall!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      gapH8,
                      Text(translation.mainPower,
                          style: context.bodySmall!.copyWith(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          )),
                      gapH8,
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.5)),
                          child: const Center(
                            child: Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Text('B4EVA')),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 20),
            child: SizedBox(
              child: Text(translation.descriptionText,
                  style: context.bodySmall!.copyWith(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  Text(translation.superPowers,
                      style: context.bodySmall!.copyWith(
                        fontSize: 12,
                        color: Colors.blue[700],
                        fontWeight: FontWeight.bold,
                      )),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Container(
                        height: 1,
                        width: 200,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              children: <Widget>[
                const SuperHero(
                  image: 'assets/images/logo1.png',
                ),
                const SuperHero(
                  image: 'assets/images/firebase.png',
                ),
                const SuperHero(
                  image: 'assets/images/mongo.png',
                ),
                const SuperHero(
                  image: 'assets/images/nodejs.png',
                ),
                const SuperHero(
                  image: 'assets/images/dart.png',
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Stack(
                    children: [
                      Image.asset('assets/images/back.png',
                          height: 100, width: 100, fit: BoxFit.contain),
                      Positioned(
                          top: 20,
                          left: 25,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('2+',
                                style: context.bodySmall!.copyWith(
                                  fontSize: 20,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                )),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SuperHero extends StatelessWidget {
  const SuperHero({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Image.asset('assets/images/back.png',
              height: 100, width: 100, fit: BoxFit.contain),
          Positioned(
              top: 10,
              left: 18,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  image,
                  height: 40,
                  width: 40,
                ),
              ))
        ],
      ),
    );
  }
}
