import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:islami_app/models/sura_data_model.dart';
import 'package:islami_app/modules/layout/quran/quran_details_view.dart';

import '../../../../core/constants/assets.dart';

class SuraListItem extends StatelessWidget {
  SuraDataModel suraDataModel;
  final VoidCallback onSuraTab;
  SuraListItem({super.key, required this.suraDataModel, required this.onSuraTab});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onSuraTab,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.suraNumberIcon,),)
              ),
              child: Text(suraDataModel.suraID.toString(), style: Theme.of(context).textTheme.bodySmall,),
            ),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suraDataModel.suraNameEN, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
                Text("${suraDataModel.suraVersusNumber} Verses", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),
              ],
            ),
            Spacer(),
            Text(suraDataModel.suraNameAR, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
