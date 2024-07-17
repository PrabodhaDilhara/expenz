import 'package:expenz/constants/colors.dart';
import 'package:expenz/data/onboarding_data.dart';
import 'package:expenz/screens/onboarding/front_page.dart';
import 'package:expenz/screens/onboarding/shared_onboarding_screen.dart';
import 'package:expenz/screens/user_data_screen.dart';
import 'package:expenz/widgets/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
//page controller
  final PageController _controller = PageController();
  bool showDetailsPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                //onboarding screen
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailsPage = index == 3;
                    });
                  },
                  children: [
                    FrontPage(),
                    SharedOnboardingScreen(
                      title: OnboardingData.onboardingdatalist[0].title,
                      imagepath: OnboardingData.onboardingdatalist[0].imagePath,
                      description:
                          OnboardingData.onboardingdatalist[0].destription,
                    ),
                    SharedOnboardingScreen(
                      title: OnboardingData.onboardingdatalist[1].title,
                      imagepath: OnboardingData.onboardingdatalist[1].imagePath,
                      description:
                          OnboardingData.onboardingdatalist[1].destription,
                    ),
                    SharedOnboardingScreen(
                      title: OnboardingData.onboardingdatalist[2].title,
                      imagepath: OnboardingData.onboardingdatalist[2].imagePath,
                      description:
                          OnboardingData.onboardingdatalist[2].destription,
                    ),
                  ],
                ),
                //page dot indicator
                Container(
                  alignment: Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                  ),
                ),

                //navigation botton
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: !showDetailsPage
                          ? GestureDetector(
                              onTap: () {
                                _controller.animateToPage(
                                  _controller.page!.toInt() + 1,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: CustomBotton(
                                buttonName:
                                    showDetailsPage ? "Get Started" : "Next",
                                buttonColor: kMainColor,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                //navigate to the user data screen

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserDataScreen(),
                                  ),
                                );
                              },
                              child: CustomBotton(
                                buttonName:
                                    showDetailsPage ? "Get Started" : "Next",
                                buttonColor: kMainColor,
                              ),
                            )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
