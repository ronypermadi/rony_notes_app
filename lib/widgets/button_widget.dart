import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isLike ? Icons.thumb_up_alt : Icons.thumb_up_off_alt,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isLike = !isLike;
        });
      },
    );
  }
}

class BookmarkButton extends StatefulWidget {
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmark = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 3.0,
      right: 3.0,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              isBookmark ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                isBookmark = !isBookmark;
              });
            },
          )
        ],
      ),
    );
  }
}
