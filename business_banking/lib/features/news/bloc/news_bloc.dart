import 'package:business_banking/features/news/api/news_service.dart';
import 'package:business_banking/features/news/bloc/news_details_usecase.dart';
import 'package:business_banking/features/news/bloc/news_usecase.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:business_banking/features/news/model/news_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class NewsBloc extends Bloc {
  NewsUsecase _useCase;
  NewsDetailsUseCase _newsDetailsUseCase;

  final newsViewModelPipe = Pipe<NewsViewModel>();
  final newsDetailsViewModelPipe = Pipe<NewsDetailsViewModel>();
  final selectedRowIndexPipe = Pipe<int>();

  @override
  void dispose() {
    newsViewModelPipe.dispose();
    newsDetailsViewModelPipe.dispose();
    selectedRowIndexPipe.dispose();
  }

  NewsBloc({NewsService newsService}) {
    _useCase = NewsUsecase((viewModel) => newsViewModelPipe.send(viewModel));
    newsViewModelPipe.whenListenedDo(() => _useCase.create());
    _newsDetailsUseCase = NewsDetailsUseCase(
        (viewModel) => newsDetailsViewModelPipe.send(viewModel));
    newsDetailsViewModelPipe.whenListenedDo(() => _newsDetailsUseCase.create());
    selectedRowIndexPipe.receive.listen(didSelectRowAtIndex);
  }

  void didSelectRowAtIndex(int index) {
    _useCase.updateSelectedNewsWithRowIndex(index);
  }
}
