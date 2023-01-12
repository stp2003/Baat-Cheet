import 'package:baatcheet/colors.dart';
import 'package:flutter/material.dart';
import 'package:baatcheet/common/widgets/custom_button.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
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
                color: whiteColor,
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: size.height / 9),
            Image.asset(
              'assets/VIT.png',
              height: 340,
              width: 340,
            ),
            SizedBox(height: size.height / 9),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Welcome to VIT BaatCheet. You must login with your Registration Number and Password.',
                style: TextStyle(color: greyColor),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10,),
            CustomButton(text: 'AGREE AND CONTINUE', onPressed: () {},),

          ],
        ),
      ),
    );
  }
}
