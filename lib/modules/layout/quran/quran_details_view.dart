import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/models/sura_data_model.dart';

import '../../../core/constants/assets.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = "/quran_details";

  QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as SuraDataModel;
    if (versesList.isEmpty)loadDataFromAssets(data.suraID);
    return Scaffold(
      backgroundColor: ColorsPallete.quranDetailsColor,
      appBar: AppBar(centerTitle: true, title: Text(data.suraNameEN)),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Assets.vectorLeftIcn, height: 90, width: 90),
                    Image.asset(Assets.vectorRightIcn, height: 90, width: 90),
                  ],
                ),
              ),
              Image.asset(Assets.mosque_img),
            ],
          ),
          Column(
            children: [
              Text(
                data.suraNameAR,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: ColorsPallete.primaryColor,
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.separated(
                  itemCount: versesList.length,
                  itemBuilder: (context, index) {
                    return Text(
                      "(${index+1}) ${versesList[index]}",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorsPallete.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                  separatorBuilder: (context, index){
                    return SizedBox(height: 4,);
                  },

                ),
              ),
              SizedBox(height: 60,)
            ],
          ),
        ],
      ),
    );
  }

  Future<void> loadDataFromAssets(int suraID) async {
    String content = await rootBundle.loadString("Assets/files/$suraID.txt");
    versesList = content.split("\n");
    setState(() {});
  }
}
