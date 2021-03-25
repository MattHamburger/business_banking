import 'package:business_banking/features/news/model/news_model.dart';
import 'package:clean_framework/clean_framework.dart';

enum NewsServiceStatus { success, fail, unknown }

class NewsViewModel extends ViewModel {
  final List<NewsModel> allNews;
  final NewsModel selectedNews;
  final NewsServiceStatus serviceStatus;

  NewsViewModel(this.allNews, this.selectedNews, this.serviceStatus);

  @override
  // implement props
  List<Object> get props => [allNews, selectedNews, serviceStatus];
}
