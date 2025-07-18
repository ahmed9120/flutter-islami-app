import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/models/hadeth_data_model.dart';

import '../../../../core/constants/assets.dart';

class HadethItemWidget extends StatelessWidget {
  HadethDataModel hadethDataModel;

  HadethItemWidget({super.key, required this.hadethDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //image: DecorationImage(image: AssetImage(Assets.hadeth_background_img)),
        borderRadius: BorderRadius.circular(16),
        color: ColorsPallete.primaryColor,
      ),
      child: Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height * 0.5,
            left: 15,
            top: 30,
            child: Opacity(
              opacity: 0.25,
              child: Image.asset(
                Assets.hadeth_background_img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Assets.vectorLeftIcnBlack,
                      height: 90,
                      width: 90,
                    ),
                    Image.asset(
                      Assets.vectorRightIcnBlack,
                      height: 90,
                      width: 90,
                    ),
                  ],
                ),
              ),
              Image.asset(Assets.mosque_hadeth_img),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Text(
                  hadethDataModel.hadethTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10,),
                Text(
                  hadethDataModel.hadethContent,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
