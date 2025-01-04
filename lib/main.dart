// import 'dart:ffi';

import 'dart:ffi';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_blog_club/carosel/carousel_slider.dart';
import 'package:flutter_application_blog_club/data.dart';
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
    final Color primaryTextColor = Color.fromARGB(255, 13, 37, 60);
    final Color secondaryTextColor = Color.fromARGB(255, 45, 67, 121);

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          textTheme: TextTheme(

              /// bodyText [story name]
              bodyMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                color: primaryTextColor,
                fontSize: 12,
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
        home: Stack(
          children: [
            Positioned.fill(
              child: const MyHomePage(title: 'Fucking blog club project'),
            ),
            Positioned(
              child: _BottomNavigation(),
              right: 0,
              left: 0,
              bottom: 0,
            ),
          ],
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //we defining this in data.main with json style
  final stories = AppDatabase.stories;
  @override
  // fixed value for themeData
  Widget build(BuildContext context) {
    final constOfThemeData = Theme.of(context);
    // # Flutter Comment:
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          // # Flutter Comment:
          //TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          // title: Text(widget.title),
          ),
      body: SafeArea(
        child: SizedBox(
          child: SingleChildScrollView(
            // for mix all  scroll view, this(main scroll) and post list scroll
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hello, MH!.',
                              style: constOfThemeData.textTheme.titleSmall),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Explore Today's",
                            style: constOfThemeData.textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      Assets.img.icons.logo.svg(width: 32, height: 32),
                      Assets.img.icons.notification
                          .image(height: 32, width: 32),
                    ],
                  ),
                ),
                _StoryList(stories: stories),
                SizedBox(
                  height: 16,
                ),
                _CategoryList(),
                SizedBox(
                  height: 32,
                ),
                // # Test of TItle of POst list
                _PostList(),
              ],
              // # Flutter comment :
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
            ),
          ),
        ),
      ),
      // # Footer in flutter app
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    // Suggestion on vscode
    // super.key,
    required this.stories,
  });

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: ListView.builder(
          itemCount: stories.length, // if you don't ste it, create infinity
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(), // scroll action
          itemBuilder: (context, index) {
            final story = stories[index];

            //it's wight builder
            return Column(
              children: [
                // # slack : when aliment is impotent use this like column
                Stack(
                  children: [
                    if (story.isViewed)
                      _ProfileImageViewed(story)
                    else
                      _ProfileImageNormal(story),
                    // # Little icon image
                    // positioned use for where. this a attribute on `slack`
                    Positioned(
                      // when choose 0 means space think in that side
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/img/icons/${story.iconFileName}',
                        height: 24,
                        width: 24,
                        // if it'snot slack, use that, [of corse might be :)]:
                      ),
                      
                    )
                  ],
                ),
                Text(story.name),
              ],
            );
          },
        ));
  }

  Widget _ProfileImageViewed(StoryData story) {
    return Container(
      // space of border and img
      margin: EdgeInsets.fromLTRB(4, 12, 4, 0),
      child: SizedBox(
        // fix size of img
        width: 68,
        height: 68,
        // # viewed story border
        child: DottedBorder(
          // for rectal
          borderType: BorderType.RRect,
          // Width of each line
          strokeWidth: 2,
          color: Color(0xff7B8BB2),
          // [number of line, number of space between tow line]
          dashPattern: [8, 3],
          radius: Radius.circular(24),
          child: _ProfileImage(story),
        ),
      ),
    );
  }

  Widget _ProfileImageNormal(StoryData story) {
    //return just wight, because we defined Widget in line before
    return Container(
      width: 68,
      height: 68,
      //margin from all contender to top bar Text
      margin: EdgeInsets.fromLTRB(4, 12, 4, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),

        // # fucking border line near on profile
        gradient: LinearGradient(

            /// where gradient start in shape
            begin: Alignment.topLeft,
            colors: [
              /// color of the liner
              Color(0xff376AED),
              Color(0xff49B0E2),
              Color(0xff9CECFB),
            ]),
      ),

      // # white container for back img
      child: Container(
        // for img margin make border, lower
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        // # profile IMG fpr story
        child: _ProfileImage(story),
      ),
    );
  }

  Widget _ProfileImage(StoryData story) {
    return Padding(
      // space between img and border
      padding: const EdgeInsets.all(5),
      // border redis
      child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Image.asset(
            // tips: dolor sign make way for call function
            //in string and use attribute in there
            //(like hear call story)
            'assets/img/stories/${story.imageFileName}',
          )),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // input from `AppDatabase`
    final categories = AppDatabase.categories;
    // make scroll list(Carousel),
    return CarouselSlider.builder(
        // how much we have cart
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          return because(
              left: realIndex == 1 ? 32 : 8,
              right: realIndex == categories.length - 1 ? 32 : 8,
              categories: categories[realIndex]);
        },
        options: CarouselOptions(
          // how much present of screen
          viewportFraction: 0.8,
          // نسبت تصویر
          aspectRatio: 1.2,
          //which item start
          initialPage: 1,
          //
          disableCenter: true,
          // change pic in auto play
          autoPlay: false,
          // never end your item, infinity
          enableInfiniteScroll: false,

          enlargeStrategy: CenterPageEnlargeStrategy.height,

          enlargeCenterPage: true,
        ));
  }
}

class because extends StatelessWidget {
  final categories;
  // write "int" because  we can send "int" into "itemBuilder"
  final int left;
  final int right;
  const because(
      {super.key,
      required this.categories,
      required this.left,
      required this.right});
  @override
  Widget build(BuildContext context) {
    // final categories = AppDatabase.categories;
    return Container(
      // margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(children: [
        //all of the container
        Positioned.fill(
            top: 65,
            bottom: 16,
            child: Positioned.fill(
              child: Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Color(0xff0D253C),
                        )
                      ])),
            )),
        Container(
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Color(0xAA0D253C),
                    Colors.transparent,
                  ])),
          // margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                  'assets/img/posts/large/${categories.imageFileName}',
                  fit: BoxFit.cover)),
        ),
        Positioned(
            bottom: 42,
            left: 48,
            child: Text('${categories.title}',
                style: Theme.of(context).textTheme.labelMedium))
      ]),
    );
  }
}

class _PostList extends StatelessWidget {
  _PostList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final postList = AppDatabase.posts;
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(left: 32, right: 24)),
        // Title and "More" Bottom in this row
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('The Latest News',
                style: Theme.of(context).textTheme.headlineSmall),
            TextButton(
                onPressed: () {},
                child: Text('More',
                    style: TextStyle(
                      color: Color.fromARGB(255, 100, 100, 255),
                    )))
          ],
        ),
        SizedBox(
          // width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: postList.length,
              itemExtent: 151,
              // bad performance in long list
              // in list view should set
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                final post = postList[index];
                return Container(
                  // not ues
                  // height: 149,
                  margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(blurRadius: 10, color: Color(0x1a5282FF))
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Row(
                      children: [
                        Image.asset(
                            'assets/img/posts/small/${post.imageFileName}'),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              // Caption Text
                              Text(
                                post.caption,
                                style: TextStyle(
                                    fontFamily: MyApp.fontFamily,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              // Title Post
                              Text(
                                post.title,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(CupertinoIcons.hand_thumbsup,
                                      size: 16,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    post.likes,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(CupertinoIcons.clock,
                                      size: 16,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    post.time,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Container(
                                    child: Expanded(
                                      child: Icon(
                                          post.isBookmarked
                                              ? CupertinoIcons.bookmark_fill
                                              : CupertinoIcons.bookmark,
                                          size: 16,
                                          color: Color.fromARGB(
                                              255, 55, 106, 237)),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}

class _Post extends StatefulWidget {
  const _Post({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  State<_Post> createState() => _PostState();
}

class _PostState extends State<_Post> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('data test in bute'),
      ],
    );
    // ignore: dead_code
    Container();
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
