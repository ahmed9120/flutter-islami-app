import 'package:flutter/material.dart';
import 'package:islami_app/modules/layout/hadeth/hadeth_view.dart';
import 'package:islami_app/modules/layout/quran/quran_view.dart';
import 'package:islami_app/modules/layout/radio/radio_view.dart';
import 'package:islami_app/modules/layout/tasbeh/tasbeh_view.dart';
import 'package:islami_app/modules/layout/time/time_view.dart';

import '../../core/constants/assets.dart';

class LayoutView extends StatefulWidget {
  static const String routeName="/Layout";
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex=0;
  List<Widget> screens=[
    QuranView(),
    HadethView(),
    TasbehView(),
    RadioView(),
    TimeView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.bottomBarIcons[0])),
              label: "Quran",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black26,
              ),
              child: ImageIcon(AssetImage(Assets.bottomBarIcons[0])),
            ),
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.bottomBarIcons[1])),
              label: "Hadeth",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black26,
              ),
              child: ImageIcon(AssetImage(Assets.bottomBarIcons[1])),
            ),
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.bottomBarIcons[2])),
              label: "Tasbeh",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black26,
              ),
              child: ImageIcon(AssetImage(Assets.bottomBarIcons[2])),
            ),
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.bottomBarIcons[3])),
              label: "Radio",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black26,
              ),
              child: ImageIcon(AssetImage(Assets.bottomBarIcons[3])),
            ),
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.bottomBarIcons[4])),
              label: "Time",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black26,
              ),
              child: ImageIcon(AssetImage(Assets.bottomBarIcons[4])),
            ),
          ),

        ],
      ),
    );
  }
}
