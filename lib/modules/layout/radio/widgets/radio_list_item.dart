import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors_pallete.dart';

class RadioListItem extends StatefulWidget {
  const RadioListItem({super.key, required this.selectedIndex, required this.moqre2Name});
  final int selectedIndex;
  final String moqre2Name;

  @override
  State<RadioListItem> createState() => _RadioListItemState();
}

class _RadioListItemState extends State<RadioListItem> {
  bool isActive = false;
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 133,
      decoration: BoxDecoration(
        color: ColorsPallete.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              isActive ? Assets.radio_active_img : Assets.radio_unactive_img,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${widget.selectedIndex == 0 ? 'Radio ' : ''}${widget.moqre2Name}",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 50),
                  Bounceable(
                    onTap: () {
                      setState(() {
                        isActive = !isActive;
                      });
                    },
                    child: Icon(
                      isActive ? Icons.pause : Icons.play_arrow_rounded,
                      size: 60,
                      color: ColorsPallete.quranDetailsColor,
                    ),
                  ),
                  Bounceable(
                    onTap: () {
                      setState(() {
                        isMuted = !isMuted;
                      });
                    },
                    child: Icon(
                      isMuted ? Icons.volume_off : Icons.volume_up_rounded,
                      size: 40,
                      color: ColorsPallete.quranDetailsColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
