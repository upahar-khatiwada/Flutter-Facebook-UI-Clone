import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/story_model.dart';
import 'package:facebook_ui/models/user_model.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final User currentUser;
  final List<Story> storiesList;
  const StoryWidget({
    super.key,
    required this.currentUser,
    required this.storiesList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storiesList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Stack(
                children: [
                  // 1️⃣ The outer container that gives the card shape and background color
                  Container(
                    height: 200,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.grey[850], // gray background for lower area
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),

                  // 2️⃣ The top image section
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: currentUser.imageUrl,
                      height: 150,
                      width: 110,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Container(
                    height: 150,
                    width: 110,
                    decoration: const BoxDecoration(
                      gradient: Palette.storyGradient,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 35,
                    left: 35,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Text(
                      'Create Story',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12.0),
                    child: CachedNetworkImage(
                      imageUrl: storiesList[index - 1].imageUrl,
                      height: double.infinity,
                      width: 110.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: 110,
                  decoration: BoxDecoration(
                    gradient: Palette.storyGradient,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 3,
                  child: Text(
                    storiesList[index - 1].user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Positioned(
                  top: 3.0,
                  left: 10.0,
                  child: Container(
                    padding: const EdgeInsets.all(1.5),
                    decoration: storiesList[index - 1].isViewed
                        ? BoxDecoration(
                            shape: BoxShape.circle,
                            border: BoxBorder.all(
                              color: Colors.blue,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                          )
                        : null,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 18,
                      backgroundImage: CachedNetworkImageProvider(
                        storiesList[index - 1].user.imageUrl,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
