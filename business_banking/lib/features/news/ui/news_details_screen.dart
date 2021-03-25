import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/news/model/news_details_view_model.dart';
import 'package:business_banking/features/news/ui/widgets/text_content_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsDetailsScreen extends Screen {
  final NewsDetailsViewModel viewModel;

  NewsDetailsScreen({@required this.viewModel});

  @override
  Widget build(BuildContext context) {
    String _publishedDate =
        DateFormat.yMMMEd().format(DateTime.parse(viewModel.publishedAt));
    final hasUrl =
        viewModel.urlToImage != null && viewModel.urlToImage.isNotEmpty;

    String _author = viewModel.author.length > 10
        ? viewModel.author.substring(0, 10)
        : viewModel.author;

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "${Uri.parse(viewModel.url).host}",
        ),
        backgroundColor: Colors.green,
        key: Key('NewsDetailsScreenAppBar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: viewModel.urlToImage,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      image: hasUrl
                          ? DecorationImage(
                              image: NetworkImage(viewModel.urlToImage),
                              fit: BoxFit.cover)
                          : null),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  TextContentWidget(
                    text: viewModel.title,
                    style: TextContentStyle.title,
                    key: Key("NewsDetailsTitle"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.edit),
                      Text(
                        _author,
                        style: TextStyle(fontSize: 14.0),
                        key: Key("NewsDetailsAuthor"),
                      ),
                      Icon(Icons.update_rounded),
                      Text(
                        '$_publishedDate',
                        style: TextStyle(fontSize: 14.0),
                        key: Key("NewsDetailsDate"),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Colors.black38,
                  ),
                  Text(
                    viewModel.description,
                    style: TextStyle(fontSize: 14.0),
                    key: Key("NewsDetailsDesc"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
