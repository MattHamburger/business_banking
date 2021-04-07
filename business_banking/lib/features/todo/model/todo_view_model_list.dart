import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class TodoViewModelList extends ViewModel {
  final List<TodoViewModel> viewModels;

  TodoViewModelList(this.viewModels);

  @override
  List<Object> get props => [viewModels];
}
