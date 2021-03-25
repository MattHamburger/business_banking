import 'package:business_banking/features/news/bloc/news_bloc.dart';
import 'package:business_banking/features/news/model/news_details_view_model.dart';
import 'package:business_banking/features/news/ui/news_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';

class NewsDetailsPresenter
    extends Presenter<NewsBloc, NewsDetailsViewModel, NewsDetailsScreen> {
  @override
  NewsDetailsScreen buildScreen(
      BuildContext context, NewsBloc bloc, NewsDetailsViewModel viewModel) {
    // implement buildScreen
    return NewsDetailsScreen(viewModel: viewModel);
  }

  @override
  Stream<NewsDetailsViewModel> getViewModelStream(NewsBloc bloc) {
    // implement getViewModelStream
    return bloc.newsDetailsViewModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
