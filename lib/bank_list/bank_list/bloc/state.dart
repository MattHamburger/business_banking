import 'package:app_interview/features_bank/bank_list/model/result_search.dart';
import 'package:app_interview/features_bank/erros/errors.dart';

abstract class SearchState {}

class SearchSuccess implements SearchState {
  final List<ResultSearch> list;

  SearchSuccess(this.list);
}

class SearchStart implements SearchState {}

class SearchLoading implements SearchState {}

class SearchError implements SearchState {
  final FailureSearch error;

  SearchError(this.error);
}