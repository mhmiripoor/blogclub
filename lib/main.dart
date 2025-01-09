// import 'dart:ffi';

// import 'dart:ffi';

// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_blog_club/Splashscreen.dart';
// import 'package:flutter_application_blog_club/carosel/carousel_slider.dart';
// import 'package:flutter_application_blog_club/data.dart';
import 'package:flutter_application_blog_club/gen/assets.gen.dart';
import 'package:flutter_application_blog_club/gen/fonts.gen.dart';

void main() {
  runApp(MyApp());
  // change color and brightnes
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const fontFamily = 'Avenir';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xff376AED);
    final Color primaryTextColor = Color.fromARGB(255, 13, 37, 60);
    final Color secondaryTextColor = Color.fromARGB(255, 45, 67, 121);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          onSurface: primaryTextColor,
          surface: Color(0xffFBFCFF),
          //on
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          foregroundColor: primaryTextColor,
          titleSpacing: 32,
          elevation: 0,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: primaryColor,
        ),
        textTheme: TextTheme(

            /// bodyText [story name]
            bodyMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontSize: 12,
            ), 
            bodyLarge: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontSize: 14,
            ),

            /// subtitle1 [hello user]
            titleSmall: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 18,
              fontWeight: FontWeight.w200,
              color: secondaryTextColor,
            ),

            /// subtitle2 [Title small list]
            titleMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: secondaryTextColor,
            ),
            //Caption in bottom navigating
            displaySmall: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w700,
              color: Color(0xff7B8BB2),
              fontSize: 10,
            ),
            headlineSmall: TextStyle(
                //headline 6 : [Explore Today's],
                fontFamily: FontFamily.avenir,
                fontSize: 24,
                color: primaryTextColor,
                fontWeight: FontWeight.w700),
            // headline 6 : [Category Cart Name]
            labelMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            )),
        useMaterial3: true,
      ),
      // home: Stack(
      //   children: [
      //     Positioned.fill(
      //       child: const MyHomePage(title: 'Fucking blog club project'),
      //     ),
      //     Positioned(
      //       child: _BottomNavigation(),
      //       right: 0,
      //       left: 0,
      //       bottom: 0,
      //     ),
      //   ],
      // )
      // Start with this page
      home: const Splashscreen(),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 85,
        // this + bottom navigation is out of normal line,
        // for this use 2 `container` into
        child: Stack(
          children: [
            Positioned(
              // down of page
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      // add opacity for this in another
                      // shadow of behind Navigation
                      BoxShadow(
                          blurRadius: 20,
                          color: Color(0xff988487).withOpacity(0.3)),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomNavigationItem(
                        iconFileNameBottomNavigation: 'Home.png',
                        iconFileNameBottomNavigationisActive: 'Home.png',
                        title: 'Home'),
                    BottomNavigationItem(
                        iconFileNameBottomNavigation: 'Articles.png',
                        iconFileNameBottomNavigationisActive: 'Articles.png',
                        title: 'Articles'),
                    SizedBox(
                      width: 18,
                    ),
                    BottomNavigationItem(
                        iconFileNameBottomNavigation: 'Search.png',
                        iconFileNameBottomNavigationisActive: 'Search.png',
                        title: 'Search'),
                    BottomNavigationItem(
                        iconFileNameBottomNavigation: 'Menu.png',
                        iconFileNameBottomNavigationisActive: 'Menu.png',
                        title: 'Menu'),
                  ],
                ),
              ),
            ),
            // dont
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                width: 65,
                height: 85,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff376AED), // Move color here
                    borderRadius: BorderRadius.circular(32.5),
                  ),
                  height: 65,
                  child: Assets.img.icons.plus.image(),
                ),
              ),
            )
          ],
        ));
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileNameBottomNavigation;
  final String iconFileNameBottomNavigationisActive;
  final String title;

  const BottomNavigationItem(
      {super.key,
      required this.iconFileNameBottomNavigation,
      required this.iconFileNameBottomNavigationisActive,
      required this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$iconFileNameBottomNavigation'),
        SizedBox(
          height: 4,
        ),
        Text(title, style: Theme.of(context).textTheme.displaySmall)
      ],
    );
  }
}
