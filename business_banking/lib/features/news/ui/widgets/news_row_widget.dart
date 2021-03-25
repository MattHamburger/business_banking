import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:business_banking/features/news/ui/widgets/text_content_widget.dart';
import 'package:business_banking/features/news/ui/widgets/thumb_image_card.dart';
import 'package:flutter/material.dart';

class NewsRowWidget extends StatelessWidget {
  final NewsViewModel viewModel;
  final Function didSelectRowAtIndex;
  final rowIndex;

  NewsRowWidget(
      {@required this.viewModel, this.didSelectRowAtIndex, this.rowIndex = 0});

  @override
  Widget build(BuildContext context) {
    final _title = viewModel.allNews[rowIndex].title ?? '';
    final _authorBy = viewModel.allNews[rowIndex].author ?? '';
    final _urlToImage = viewModel.allNews[rowIndex].urlToImage ?? '';
    final uniqueKey = 'disclosureAction' + '$rowIndex';
    return InkWell(
      key: Key(uniqueKey),
      onTap: () => didSelectRowAtIndex(rowIndex),
      child: Container(
        height: 75.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ThumbImageCard(imgUrl: _urlToImage),
            SizedBox(width: 5.0),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextContentWidget(
                      text: _title, style: TextContentStyle.title),
                  TextContentWidget(
                      text: 'By $_authorBy', style: TextContentStyle.subtitle),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              semanticLabel: 'Disclosure',
            ),
          ],
        ),
      ),
    );
  }
}
