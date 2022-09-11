import 'package:flutter/material.dart';
import 'package:masterclass_app/src/common/widget/custom_card.dart';
import 'package:masterclass_app/src/feature/profile/widget/social_button.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({Key? key, required this.name, required this.imageUrl, required this.bio}) : super(key: key);

  final String name;
  final String imageUrl;
  final String bio;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(name, style: textTheme.headline2),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(bio, style: textTheme.bodyText1, textAlign: TextAlign.center),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: MediaQuery.of(context).size.width * .55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialButton(
                    onTap: () {},
                    iconUrl: 'assets/icons/ionic-logo-whatsapp.png',
                  ),
                  SocialButton(
                    onTap: () {},
                    iconUrl: 'assets/icons/awesome-github-alt.png',
                  ),
                  SocialButton(
                    onTap: () {},
                    iconUrl: 'assets/icons/awesome-instagram.png',
                  ),
                  SocialButton(
                    onTap: () {},
                    iconUrl: 'assets/icons/awesome-facebook.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
