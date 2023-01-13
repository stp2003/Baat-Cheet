import 'package:baatcheet/colors.dart';
import 'package:baatcheet/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../auth/screens/login_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    // for equal size on all screens
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'VIT BaatCheet',
              style: TextStyle(
                letterSpacing: 1,
                color: whiteColor,
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: size.height / 11),
            Image.asset(
              'assets/vit_logo.png',
              height: 340,
              width: 340,
            ),
            SizedBox(height: size.height / 11),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Welcome to VIT BaatCheet. You must login with your VIT Email I.D and Password.',
                style: TextStyle(
                  color: greyColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            // Using Custom button made for all screen
            SizedBox(
              width: size.width * 0.8,
              child: CustomButton(
                text: 'AGREE AND CONTINUE',
                onPressed: () => navigateToLoginScreen(context),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }

  // Function for navigation to login screen ->
  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }
}
