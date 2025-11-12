import 'package:facebook_ui/data/data.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hexcolor/hexcolor.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#252728'),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
            radius: 20.0,
            backgroundColor: Colors.grey,
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.black,
                filled: true,
                hintText: 'What\'s on your mind?',
                hintStyle: const TextStyle(color: Colors.white),

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(36.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(36.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          const Icon(Icons.image, color: Colors.green, size: 30),
        ],
      ),
    );
  }
}
