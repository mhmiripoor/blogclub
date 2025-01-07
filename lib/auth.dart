import 'dart:ui'; // Keep this for Size

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_blog_club/gen/assets.gen.dart';
import 'package:flutter_application_blog_club/home.dart';

class authScreen extends StatelessWidget {
  const authScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
      color: themeData.colorScheme.onPrimary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16, top: 16),
            ),
            Assets.img.icons.logo.svg(width: 120),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  color: themeData.colorScheme.primary,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'login'.toUpperCase(),
                            style: tabTextStyle,
                          ),
                          Text(
                            'signup'.toUpperCase(),
                            style: tabTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.surface,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32))),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.all(32)),
                              Text(
                                'welcome back',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'sign in your account',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(fontSizeFactor: 0.9),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextField(
                                decoration:
                                    InputDecoration(label: Text('Username')),
                              ),
                              //PASSWORD
                              TextField(
                                decoration:
                                    InputDecoration(label: Text('password')),
                                obscureText: true,
                                enableSuggestions: false,
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => MyHomePage(
                                                  title: 'fuck this screen',
                                                )));
                                  },
                                  style: ButtonStyle(
                                      minimumSize:
                                          WidgetStateProperty.all<Size>(
                                        Size(MediaQuery.of(context).size.width,
                                            60), // Correct size definition
                                      ),
                                      shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)))),
                                  child: Text('Login'.toUpperCase())),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Forget password?'),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text('reaset hear')),
                                ],
                              ),
                              Center(
                                child: Text('SIGN IN YOUR ACCOUNT WITH'),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Assets.img.icons.google
                                      .image(width: 36, height: 36),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  Assets.img.icons.facebook
                                      .image(width: 36, height: 36),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  Assets.img.icons.twitter
                                      .image(width: 36, height: 36),
                                  SizedBox(
                                    width: 24,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
