import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/constants.dart';
import 'package:islami_app/core/services/local_storage_keys.dart';
import 'package:islami_app/core/services/local_storage_services.dart';
import 'package:islami_app/models/sura_data_model.dart';
import 'package:islami_app/modules/layout/quran/quran_details_view.dart';
import 'package:islami_app/modules/layout/quran/widgets/recentaly_sura_widget.dart';
import 'package:islami_app/modules/layout/quran/widgets/sura_list_widget.dart';

import '../../../core/constants/assets.dart';
import '../../../core/constants/colors_pallete.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  void initState() {
    super.initState();
    loadRecentData();
  }

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.layoutBackgroundImages[0]),
          fit: BoxFit.cover,
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Image.asset(Assets.headerLogo)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 1,
              ),
              child: TextFormField(
                onChanged: (value) {
                  searchQuery = value;
                  search();
                  setState(() {});
                },
                cursorColor: ColorsPallete.primaryColor,
                decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ColorsPallete.primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ColorsPallete.primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ColorsPallete.primaryColor),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageIcon(
                      AssetImage(Assets.bottomBarIcons[0]),
                      color: ColorsPallete.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          recentSurasList.isNotEmpty && searchQuery.isEmpty
              ? SliverToBoxAdapter(
                  child: RecentalySuraWidget(
                    suraDataModelList: recentSurasList,
                  ),
                )
              : SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      searchQuery.isNotEmpty ? "" : "no recent suras",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(color: ColorsPallete.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
          SuraListWidget(
            onSuraTab: onTapSura,
            suraDataModelList: searchQuery.isEmpty
                ? Constants.suraDataList
                : searchSuraList,
          ),
        ],
      ),
    );
  }

  List<String> recentSurasIndexList = [];

  List<SuraDataModel> recentSurasList = [];

  onTapSura(int suraID) {
    _cacheSuraIndex(suraID);
    final selectedSura = Constants.suraDataList.firstWhere((sura) => sura.suraID == suraID);
    Navigator.pushNamed(
      context,
      QuranDetailsView.routeName,
      arguments: selectedSura,
    );
  }

  _cacheSuraIndex(int index) {
    String indexString = index.toString();
    if (recentSurasIndexList.contains(indexString)) {
      return;
    }
    if (recentSurasIndexList.length == 5) {
      recentSurasIndexList.removeLast();
    }
    recentSurasIndexList.insert(0, indexString);
    LocalStorageServices.setStringList(
      LocalStorageKeys.recentSuras,
      recentSurasIndexList,
    );
    loadRecentData();
    setState(() {});
  }

  loadRecentData() {
    recentSurasIndexList = [];
    recentSurasList = [];
    recentSurasIndexList =
        LocalStorageServices.getStringList(LocalStorageKeys.recentSuras) ?? [];
    for (var index in recentSurasIndexList) {
      int indexInt = int.parse(index);
      final sura = Constants.suraDataList.firstWhere((sura) => sura.suraID == indexInt);
      recentSurasList.add(sura);
    }
  }

  List<SuraDataModel> searchSuraList = [];

  void search() {
    searchSuraList = [];
    for (var sura in Constants.suraDataList) {
      if ((sura.suraNameEN.toLowerCase().contains(searchQuery.toLowerCase())) ||
          (sura.suraNameAR.contains(searchQuery))) {
        searchSuraList.add(sura);
      }
    }
  }
}
