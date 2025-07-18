import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/core/services/local_storage_keys.dart';
import 'package:islami_app/core/services/local_storage_services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/assets.dart';
import '../layout/layout_view.dart';
import 'models/onBoarding_page_class.dart';

class OnBoardingView extends StatefulWidget {
  static const String routeName="/onBoarding";
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller =PageController();
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.headerLogo),
          SizedBox(
            width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height/2.5,
            child: PageView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index){
                setState(() {
                  currentIndex=index;
                });
              },
              itemBuilder: (context, index){
                return Image.asset(onBoardingList[index].pageImage,);
              },
              itemCount: onBoardingList.length,
            ),
          ),
          Container(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 30, vertical: 10),
            height:220 ,
            child: Column(
              children: [
                Expanded(child: Text(
                  onBoardingList[currentIndex].pageTilte,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorsPallete.primaryColor),
                ),),
                Expanded(child: Text(
                  onBoardingList[currentIndex].pageDescription,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorsPallete.primaryColor),
                ),)
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Bounceable(
                      onTap: (){
                        if(currentIndex==0){
                          return;
                        }else{
                          currentIndex--;
                          _controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
                        }
                        setState(() {});
                      },
                      child: Text(
                        "${(currentIndex==0)?"":"Back"}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorsPallete.primaryColor),
                      )),
                ),
                SizedBox(
                  width: 90,
                  child: SmoothPageIndicator(
                      controller: _controller,
                      count:onBoardingList.length,
                    effect: WormEffect(
                      dotColor: Color(0xFF707070),
                      activeDotColor: ColorsPallete.primaryColor,
                      dotWidth: 10,
                      dotHeight: 10,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Bounceable(
                        onTap: (){
                          setState(() {
                            if(currentIndex<onBoardingList.length-1){
                              currentIndex++;
                              _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
                            }else if(currentIndex== onBoardingList.length-1){
                              Navigator.pushReplacementNamed(context, LayoutView.routeName);
                              _setOnBoardingSeen();
                            }
                          });
                        },
                        child: Text(
                          "${(currentIndex==onBoardingList.length-1)?"Finished":"Next"}",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorsPallete.primaryColor),
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
  void _setOnBoardingSeen()async{
    await LocalStorageServices.setBool(LocalStorageKeys.onBoarding, true);
  }
}
