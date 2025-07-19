import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/core/constants/constants.dart';
import 'package:islami_app/modules/layout/radio/widgets/radio_list_item.dart';

class RadioListWidget extends StatelessWidget {
  const RadioListWidget({super.key, required this.selectedIndex});
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: Constants.radioQura2List.length,
      itemBuilder: (context, index){
        return RadioListItem(selectedIndex: selectedIndex, moqre2Name: Constants.radioQura2List[index],);
      },
      separatorBuilder: (context, index){
        return SizedBox(height: 8,);
      },
    );
  }
}
