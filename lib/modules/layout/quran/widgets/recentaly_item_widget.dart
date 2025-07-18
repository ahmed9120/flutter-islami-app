import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/models/sura_data_model.dart';

import '../../../../core/constants/assets.dart';

class RecentalyItemWidget extends StatelessWidget {
  const RecentalyItemWidget({super.key, required this.suraDataModel});
  final SuraDataModel suraDataModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285,
      height: 155,
      decoration: BoxDecoration(
        color: ColorsPallete.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suraDataModel.suraNameEN,style: Theme.of(context).textTheme.headlineSmall,),
                Text(suraDataModel.suraNameAR,style: Theme.of(context).textTheme.headlineSmall,),
                Text(suraDataModel.suraVersusNumber,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black)),
              ],
            ),
          ),
          Expanded(child: Image.asset(Assets.openQuranImage, fit: BoxFit.cover,)),
        ],
      ),
    );
  }
}
