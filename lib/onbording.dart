import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_blog_club/auth.dart';
import 'package:flutter_application_blog_club/data.dart';
import 'package:flutter_application_blog_club/gen/assets.gen.dart';
import 'package:flutter_application_blog_club/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBoardingItems;
  int page = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
        // debugPrint("page select is : $page");
        super.initState();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData = Theme.of(context);
    return Scaffold(
      backgroundColor: ThemeData.colorScheme.surface,
// all page is hear, pic and text
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 32),
          child: SafeArea(
            child: Column(
              children: [
                Assets.img.background.onboarding.image(),
                SizedBox(
                  height: 324,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
                    decoration: BoxDecoration(
                        color: ThemeData.colorScheme.surface,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32))),
                    child: Column(
                      children: [
                        Expanded(
                            child: PageView.builder(
                                itemCount: items.length,
                                controller: _pageController,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(items[index].title,
                                          style: ThemeData
                                              .textTheme.headlineSmall),
                                      SizedBox(
                                        height: 24,
                                      ),
                                      Text(items[index].description,
                                          style: ThemeData.textTheme.bodyMedium!
                                              .apply(fontSizeFactor: (1.5))),
                                    ],
                                  );
                                })),
                        Container(
                          padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmoothPageIndicator(
                                controller: _pageController,
                                count: items.length,
                                effect: ExpandingDotsEffect(
                                  activeDotColor: ThemeData.colorScheme.primary,
                                  dotColor: ThemeData.colorScheme.primary
                                      .withOpacity(0.1),
                                  dotWidth: 8,
                                  dotHeight: 8,
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    if (page == items.length - 1) {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) => authScreen()));
                                    } else {
                                      _pageController.animateToPage(page + 1,
                                          duration: Durations.medium1,
                                          curve: Curves.decelerate);
                                    }
                                  },
                                  style: ButtonStyle(
                                      minimumSize:
                                          WidgetStatePropertyAll(Size(84, 60)),
                                      shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)))),
                                  child: Icon(page == items.length - 1
                                      ? CupertinoIcons.check_mark
                                      : CupertinoIcons.arrow_right)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
