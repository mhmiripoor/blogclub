import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_blog_club/gen/assets.gen.dart';
import 'package:flutter_application_blog_club/onbording.dart';

class Splashscreen extends StatefulWidget {
  // should learn more about this
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  // for change state and do sth else
  void initState() {
    //  Future.delayed : Set time and `than` method for do after this
    Future.delayed(
            // Duration how much time wait in this page.
            // we can use deferent time managment like day and...
            Duration(seconds: 3))
        //after this time, what page do
        .then(
      (value) {
        Navigator.of(context).
            // `pushReplacement` and `pushReplacement` do same action.
            // deferent is `pushReplacement` can't use back bottom for back to splashscreen
            //با دکمه برگشت نمیتونه به صفجه لودیننگ برگرده
            //
            pushReplacement(
                // for animation go to next page
                CupertinoPageRoute(builder: (context) {
          // go to this page
          // title is required
          return Onboarding();
        }));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //we dont think need this
          Positioned.fill(
              child: Assets.img.background.splash.image(fit: BoxFit.cover)),
          Center(
            child: Assets.img.icons.logo.svg(width: 100),
          )
        ],
      ),
    );
  }
}
