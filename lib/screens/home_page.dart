import 'package:facebook_ui/screens/tabs/home_page_tab.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:facebook_ui/components/components.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black,
                title: const Text(
                  'facebook',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.0,
                  ),
                ),
                centerTitle: false,
                pinned: true,
                snap: true,
                floating: true,
                actions: <Widget>[
                  const CircleButton(icon: Icons.add),
                  const CircleButton(icon: Icons.search),
                  CircleButton(icon: MdiIcons.facebookMessenger),
                ],
                bottom: TabBar(
                  dragStartBehavior: DragStartBehavior.start,
                  isScrollable: false,
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: <Widget>[
                    const Tab(
                      icon: Icon(Icons.home, color: Colors.white, size: 30.0),
                    ),
                    Tab(
                      icon: Icon(
                        MdiIcons.video,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    const Tab(
                      icon: Icon(Icons.people, color: Colors.white, size: 30.0),
                    ),
                    const Tab(
                      icon: Icon(
                        Icons.storefront,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    const Tab(
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    const Tab(
                      icon: Icon(Icons.menu, color: Colors.white, size: 30.0),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: <Widget>[
              HomePageTab(),
              Center(
                child: Text(
                  'Groups Page',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  'Videos Page',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  'Notifications Page',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Center(
                child: Text('Menu Page', style: TextStyle(color: Colors.white)),
              ),
              Center(
                child: Text(
                  'Store Page',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
