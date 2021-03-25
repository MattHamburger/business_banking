import 'package:flutter/material.dart';

enum TextContentStyle { title, subtitle }

class TextContentWidget extends StatelessWidget {
  final String text;
  final TextContentStyle style;

  const TextContentWidget({Key key, @required this.text, @required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${text.replaceAll(r'\', '')}',
      style: TextStyle(
        fontSize: 13.0,
        fontWeight: (style == TextContentStyle.title)
            ? FontWeight.bold
            : FontWeight.normal,
        color: Colors.black,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
