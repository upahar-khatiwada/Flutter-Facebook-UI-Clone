import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Posts extends StatelessWidget {
  final List<Post> postsList;
  const Posts({super.key, required this.postsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: postsList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: HexColor('#252728'),
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // starting row for logo and name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 22.0,
                          backgroundImage: CachedNetworkImageProvider(
                            postsList[index].user.imageUrl,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        // A column to flex the name and post time
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              postsList[index].user.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${postsList[index].timeAgo} • ',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                Icon(
                                  MdiIcons.earth,
                                  color: Colors.grey,
                                  size: 14.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    // place to add the actions buttons
                    const Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(Icons.more_horiz, color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(Icons.close, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // caption
              Text(
                postsList[index].caption,
                style: const TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 8.0),

              if (postsList[index].imageUrl.isNotEmpty)
                ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: postsList[index].imageUrl,
                  ),
                ),

              const SizedBox(height: 4.0),

              // likes and other row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(Icons.thumb_up_sharp, color: Colors.blue),
                        const SizedBox(width: 4.0),
                        Text(
                          postsList[index].likes.toString(),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '${postsList[index].comments.toString()} comments',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          '${postsList[index].shares.toString()} comments',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // final likes buttons and others
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text(
                      'Like',
                      style: TextStyle(color: Colors.grey),
                    ),
                    icon: const Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text(
                      'Like',
                      style: TextStyle(color: Colors.grey),
                    ),
                    icon: const Icon(
                      Icons.comment_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text(
                      'Like',
                      style: TextStyle(color: Colors.grey),
                    ),
                    icon: const Icon(Icons.share, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
