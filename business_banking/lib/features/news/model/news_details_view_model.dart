import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class NewsDetailsViewModel extends ViewModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final int itemIndex;

  NewsDetailsViewModel({
    Key key,
    @required this.author,
    @required this.title,
    @required this.description,
    @required this.url,
    @required this.urlToImage,
    @required this.publishedAt,
    this.itemIndex = 0,
  });

  @override
  // TODO: implement props
  List<Object> get props =>
      [author, title, description, url, urlToImage, publishedAt, itemIndex];
}
