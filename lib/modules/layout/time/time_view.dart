import 'package:flutter/material.dart';
import 'package:islami_app/modules/layout/time/widgets/azkar_card.dart';
import 'package:islami_app/modules/layout/time/widgets/pray_time_card.dart';

import '../../../core/constants/assets.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.layoutBackgroundImages[4]),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(Assets.headerLogo),
              PrayTimeCard(),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Azkar",style:  Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.start,),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(child: AzkarCard(isEventAzkar: true,)),
                  SizedBox(width: 10,),
                  Expanded(child: AzkarCard(isEventAzkar: false,)),
          
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
