import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/modules/layout/hadeth/widgets/hadeth_item_widget.dart';

import '../../../core/constants/assets.dart';
import '../../../models/hadeth_data_model.dart';

class HadethView extends StatefulWidget {
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  @override
  Widget build(BuildContext context) {
    if (hadethDataList.isEmpty) loadHadethDataFromAssets();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.layoutBackgroundImages[1]),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Image.asset(Assets.headerLogo),
          CarouselSlider(
            items: hadethDataList.map((e) {
              return HadethItemWidget(hadethDataModel: e);
            }).toList(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.6,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  List<HadethDataModel> hadethDataList = [];

  Future<void> loadHadethDataFromAssets() async {
    for (int i = 1; i <= 50; i++) {
      String singleHadeth = await rootBundle.loadString(
        "Assets/Hadeeth/h$i.txt",
      );

      int indexOfTitle = singleHadeth.indexOf("\n");
      String hadethTitle = singleHadeth.substring(0, indexOfTitle);
      String hadethContent = singleHadeth.substring(indexOfTitle + 1);
      hadethDataList.add(
        HadethDataModel(hadethTitle: hadethTitle, hadethContent: hadethContent),
      );
      setState(() {});
    }
  }
}
