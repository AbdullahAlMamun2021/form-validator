import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

import 'package:flutter/material.dart';
import 'package:food_commerce/src/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("images/img.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Enterprise Team  Collaboration.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typeseng industry. Lorem Ipsum has been the indu standard dummy text Lorem ipsum dolor sit amet.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.hintColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomSlidingSegmentedControl<int>(
                children: const {
                  0: Text('Login'),
                  1: Text('Register'),
                },
                duration: const Duration(milliseconds: 200),
                radius: 30.0,
                onValueChanged: (index) {
                  print(index);
                },
                backgroundColor: AppColors.secondaryColor,
                thumbColor: AppColors.textColor,
                isStretch: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
