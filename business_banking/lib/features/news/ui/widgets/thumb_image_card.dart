import 'package:flutter/material.dart';

class ThumbImageCard extends StatelessWidget {
  final String imgUrl;

  const ThumbImageCard({Key key, @required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasUrl = imgUrl != null && imgUrl.isNotEmpty;
    return Hero(
      tag: imgUrl,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Container(
            width: 50,
            height: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0)),
                image: hasUrl ? DecorationImage(
                    image: NetworkImage(imgUrl), fit: BoxFit.cover) : null),
          ),
        ),
      ),
    );
  }
}