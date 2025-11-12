import 'package:flutter/material.dart';
import 'package:facebook_ui/components/components.dart';
import 'package:facebook_ui/data/data.dart';

class HomePageTab extends StatelessWidget {
  const HomePageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const PostContainer(),
          StoryWidget(currentUser: currentUser, storiesList: stories),
          Posts(postsList: posts)
        ],
      ),
    );
  }
}
