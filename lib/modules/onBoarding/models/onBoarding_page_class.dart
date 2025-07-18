import '../../../core/constants/assets.dart';

class OnBoardingPage{
   String pageImage;
   String pageTilte;
   String pageDescription;

  OnBoardingPage({required this.pageImage, required this.pageTilte, this.pageDescription=""});
}


List<OnBoardingPage> onBoardingList=[
  OnBoardingPage(pageImage: Assets.onBoardingImages[0], pageTilte: "Welcome To Islami App"),
  OnBoardingPage(pageImage: Assets.onBoardingImages[1], pageTilte: "Welcome To Islami", pageDescription: "We Are Very Excited To Have You In Our Community"),
  OnBoardingPage(pageImage: Assets.onBoardingImages[2], pageTilte: "Reading the Quran", pageDescription: "Read, and your Lord is the Most Generous"),
  OnBoardingPage(pageImage: Assets.onBoardingImages[3], pageTilte: "Bearish", pageDescription: "Praise the name of your Lord, the Most High"),
  OnBoardingPage(pageImage: Assets.onBoardingImages[4], pageTilte: "Holy Quran Radio", pageDescription: "You can listen to the Holy Quran Radio through the application for free and easily "),
];