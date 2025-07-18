import 'package:flutter/material.dart';
import 'package:islami_app/core/services/local_storage_keys.dart';
import 'package:islami_app/core/services/local_storage_services.dart';

import '../../core/constants/assets.dart';
import '../layout/layout_view.dart';
import '../onBoarding/on_boarding_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName="/splash";

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}


class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigate();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover,image: AssetImage(Assets.splashBackground)),

      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }

  _navigate()async{
    await Future.delayed(const Duration(seconds: 1));
    final hasSeenOnBoarding= LocalStorageServices.getBool(LocalStorageKeys.onBoarding)??false;
    if(hasSeenOnBoarding){
      Navigator.pushReplacementNamed(context, LayoutView.routeName);
    }else{
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    }
  }
}
