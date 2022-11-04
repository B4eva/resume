import 'package:flutter/material.dart';

class SocialAuthContainer extends StatelessWidget {
  final VoidCallback? instagramPress;
  final VoidCallback? onFacebookPress;
  final VoidCallback? onTwitterPress;

  const SocialAuthContainer({
    Key? key,
    this.instagramPress,
    required this.onFacebookPress,
    required this.onTwitterPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        return Container(
          height: 55,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              socialAuth(
                color: Colors.green,
                iconUrl: 'assets/images/instagram.jpg',
                onTap: instagramPress!,
              ),
              socialAuth(
                  color: Colors.green,
                  iconUrl: 'assets/images/facebook.png',
                  onTap: onFacebookPress!),
              socialAuth(
                  color: Colors.green,
                  iconUrl: 'assets/images/twitter.png',
                  onTap: instagramPress!),
            ],
          ),
        );
      },
    );
  }

  socialAuth(
      {required color, required String iconUrl, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        iconUrl,
        height: 30,
        fit: BoxFit.cover,
      ),
    );
  }
}
