import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';

class PrayTimeCard extends StatelessWidget {
  const PrayTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 301,
      decoration: BoxDecoration(
        color: ColorsPallete.primaryColor,
        borderRadius: BorderRadius.circular(16)
      ),
    );
  }
}
