import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';

import '../../../../core/constants/assets.dart';

class AzkarCard extends StatelessWidget {
  AzkarCard({super.key, required this.isEventAzkar});
  bool isEventAzkar;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: ColorsPallete.timePrayCarsoursliderColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorsPallete.azkarBorderColor,
              width: 2,
        )
      ),
      child: Column(
        children: [
          Image.asset(isEventAzkar? Assets.event_azkar_img : Assets.morning_azkar_img, height: 160,),
          Text(isEventAzkar? "Event Azkar" : "Morning Azkar", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),)
        ],
      ),
    );
  }
}
