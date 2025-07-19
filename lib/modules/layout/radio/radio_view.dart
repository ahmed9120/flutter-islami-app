import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/modules/layout/radio/widgets/radio_list_widget.dart';

import '../../../core/constants/assets.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.layoutBackgroundImages[3]),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Image.asset(Assets.headerLogo),
            Container(
              decoration: BoxDecoration(
                color: ColorsPallete.radioBottomsBacgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: selectedIndex == 0 ? ColorsPallete.primaryColor : Colors.transparent,
                      ),
                      child: Text(
                        "Radio",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(color: selectedIndex == 0 ? Colors.black : Colors.white,),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:  selectedIndex == 1 ? ColorsPallete.primaryColor : Colors.transparent,
                      ),
                      child: Text(
                        "Reciters",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(color: selectedIndex == 1 ? Colors.black : Colors.white,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: RadioListWidget(selectedIndex:selectedIndex,)),
          ],
        ),
      ),
    );
  }
}
