import 'package:business_banking/features/news/bloc/news_bloc.dart';
import 'package:business_banking/features/news/ui/news_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (_) => NewsBloc(),
      child: NewsPresenter(),
    );
  }
}
