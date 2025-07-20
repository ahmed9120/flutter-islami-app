import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';

class PrayTimeCard extends StatefulWidget {
  PrayTimeCard({super.key});

  @override
  State<PrayTimeCard> createState() => _PrayTimeCardState();
}

class _PrayTimeCardState extends State<PrayTimeCard> {
  bool isMuted=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 301,
      decoration: BoxDecoration(
        color: ColorsPallete.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 110,
              height: 80,
              decoration: BoxDecoration(
                color: ColorsPallete.timePrayCurveColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                  topLeft: Radius.circular(16),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 110,
              height: 80,
              decoration: BoxDecoration(
                color: ColorsPallete.timePrayCurveColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 76,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Text(
                          "16 Jul,",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "2025,",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Pray Time",
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(color: Color(0xB5202020)),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Tuesday",
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(color: Color(0xE5202020)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "09 Muh,",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "1447,",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CarouselSlider(
                      items: [
                        Container(
                          width: 104,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors:[ColorsPallete.timePrayCarsoursliderColor,Colors.transparent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Asr", style: Theme.of(context).textTheme.bodyLarge,),
                              Text("04:38", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 32),),
                              Text("PM", style: Theme.of(context).textTheme.bodyLarge,),
                            ],
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 128,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.28,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.18,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex:5,child: Text("Next Pray - 02:32",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorsPallete.radioBottomsBacgroundColor),textAlign: TextAlign.end,)),
                        Expanded(
                          flex: 2,
                          child: Bounceable(
                            onTap: () {
                              setState(() {
                                isMuted = !isMuted;
                              });
                            },
                            child: Icon(
                              isMuted ? Icons.volume_off : Icons.volume_up_rounded,
                              size: 30,
                              color: ColorsPallete.quranDetailsColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
