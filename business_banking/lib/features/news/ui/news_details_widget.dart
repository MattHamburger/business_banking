import 'package:business_banking/features/news/bloc/news_bloc.dart';
import 'package:business_banking/features/news/ui/news_details_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class NewsDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return BlocProvider<NewsBloc>(
      create: (_) => NewsBloc(),
      child: NewsDetailsPresenter(),
    );
  }
}
