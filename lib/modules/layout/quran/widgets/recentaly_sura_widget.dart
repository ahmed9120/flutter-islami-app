import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:islami_app/models/sura_data_model.dart';
import 'package:islami_app/modules/layout/quran/widgets/recentaly_item_widget.dart';

import '../../../../core/constants/constants.dart';
import '../quran_details_view.dart';

class RecentalySuraWidget extends StatelessWidget {
  RecentalySuraWidget({super.key, required this.suraDataModelList});

  final List<SuraDataModel> suraDataModelList;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            "Most Recently ",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        SizedBox(
          height: 155,
          child: ListView.separated(
            padding: EdgeInsetsGeometry.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Bounceable(
                onTap: (){
                  Navigator.pushNamed(
                    context,
                    QuranDetailsView.routeName,
                    arguments: suraDataModelList[index],
                  );
                },
                child: RecentalyItemWidget(
                  suraDataModel: suraDataModelList[index],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 10);
            },
            itemCount: suraDataModelList.length,
          ),
        ),
      ],
    );
  }
}
