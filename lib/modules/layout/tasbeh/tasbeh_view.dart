import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/constants/assets.dart';

class TasbehView extends StatefulWidget {
  const TasbehView({super.key});

  @override
  State<TasbehView> createState() => _TasbehViewState();
}

class _TasbehViewState extends State<TasbehView>with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    viewdZekr = tasbehList[index];

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: pi * 2).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.layoutBackgroundImages[2]),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Image.asset(Assets.headerLogo),
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Image.asset(Assets.tasbeh_tail_img, width: 93, height: 106),
          GestureDetector(
            onTap: onSebhaTap,
            child: Expanded(
              child: Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: (totalTapCount % 33) * (2 * pi / 8),
                      child: Image.asset(Assets.sebha_body_img),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(viewdZekr, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium,),
                        Text(viewedCounter.toString(), textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium,),
                      ],
                    ),
                  ],
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
  List<String> tasbehList=[
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا اله الا الله"
  ];
  String viewdZekr="";
  int viewedCounter=0;
  int index=0;
  int totalTapCount = 0;
  void onSebhaTap(){
    totalTapCount++;
    if(index==tasbehList.length)index=0;
    viewdZekr=tasbehList[index];
    if(viewedCounter<5){
      viewedCounter++;
    }else{
      index++;
      if (index == tasbehList.length) index = 0;
      viewedCounter = 0;
    }
    viewdZekr = tasbehList[index];

    _controller.reset();
    _controller.forward();
    setState(() {});
  }
}
