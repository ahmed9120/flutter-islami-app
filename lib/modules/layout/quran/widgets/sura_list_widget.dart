import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/constants.dart';
import 'package:islami_app/models/sura_data_model.dart';
import 'package:islami_app/modules/layout/quran/widgets/sura_list_item.dart';

class SuraListWidget extends StatelessWidget {
  final void Function(int) onSuraTab;
  SuraListWidget({super.key, required this.onSuraTab, required this.suraDataModelList});
  List<SuraDataModel> suraDataModelList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(
              "Sura List ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }
        return Column(
          children: [
            SuraListItem(suraDataModel: suraDataModelList[index -1 ], onSuraTab:()=> onSuraTab(suraDataModelList[index - 1].suraID),),
            Divider(height: 20, thickness: 1, indent: 30, endIndent: 30)
          ],
        );
      },
      childCount: suraDataModelList.length+1
      ),
    );
  }
}

