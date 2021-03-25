import 'package:business_banking/features/news/bloc/news_bloc.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:business_banking/features/news/ui/news_screen.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class NewsPresenter extends Presenter<NewsBloc, NewsViewModel, NewsScreen> {
  @override
  NewsScreen buildScreen(
      BuildContext context, NewsBloc bloc, NewsViewModel viewModel) {
    // implement buildScreen
    return NewsScreen(
      viewModel: viewModel,
      didSelectRowAtIndex: (value) {
        _sendRowIndexToPipe(context, bloc, value);
      },
    );
  }

  @override
  Stream<NewsViewModel> getViewModelStream(NewsBloc bloc) {
    // implement getViewModelStream
    return bloc.newsViewModelPipe.receive;
  }

  void _sendRowIndexToPipe(BuildContext context, NewsBloc bloc, int index) {
    bloc.selectedRowIndexPipe.send(index);
    _pushNewsDetail(context);
  }

  void _pushNewsDetail(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.newsDetailRoute);
  }
}
