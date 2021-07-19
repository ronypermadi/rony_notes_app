import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 3.0,
      right: 3.0,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              isLike ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                isLike = !isLike;
              });
            },
          )
        ],
      ),
    );
  }
}
