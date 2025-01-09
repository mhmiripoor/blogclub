import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_blog_club/data.dart';
import 'package:flutter_application_blog_club/gen/assets.gen.dart';
import 'package:flutter_application_blog_club/home.dart';

class profileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData.colorScheme.surface.withOpacity(0),
        title: Text('profile'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz_rounded)),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(32, 32, 32, 32),
                  decoration: BoxDecoration(
                      color: ThemeData.colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            color: ThemeData.colorScheme.onSurface),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Assets.img.stories.story8
                                    .image(width: 84, height: 84)),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '@joviedan',
                                    style: ThemeData.textTheme.bodyMedium!
                                        .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text('Jovi Daniel',
                                      style: ThemeData.textTheme.titleSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w700)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'UX Designer',
                                    style: ThemeData.textTheme.bodyLarge!.apply(
                                        color: ThemeData.colorScheme.primary),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                        child: Text(
                          'About Me',
                          style: ThemeData.textTheme.headlineSmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                        child: Text(
                          'Madison Blackstone is a director of user experience design, with experience managing global teams',
                          style: ThemeData.textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 96,
                    right: 96,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.black,
                        )
                      ]),
                    )),
                Positioned(
                  bottom: 0,
                  left: 64,
                  right: 64,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                      color: ThemeData.colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xff2151CD),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '250',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeData.colorScheme.onPrimary),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Flowing',
                                  style: ThemeData.textTheme.bodyMedium!.apply(
                                      color: ThemeData.colorScheme.onPrimary),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.5 K',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: ThemeData.colorScheme.onPrimary),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Flowers',
                                    style: ThemeData.textTheme.bodyMedium!
                                        .apply(
                                            color: ThemeData
                                                .colorScheme.onPrimary),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '52',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: ThemeData.colorScheme.onPrimary),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'posts',
                                    style: ThemeData.textTheme.bodyMedium!
                                        .apply(
                                            color: ThemeData
                                                .colorScheme.onPrimary),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
                decoration: BoxDecoration(
                    color: ThemeData.colorScheme.surface,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32),
                        topLeft: Radius.circular(32))),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          'My Posts ',
                          style: ThemeData.textTheme.labelMedium,
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.grid_view_outlined)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.format_list_bulleted_rounded))
                      ],
                    ),
                  ),
                  Post(postList: posts)
                ]))
          ],
        ),
      ),
    );
  }
}
