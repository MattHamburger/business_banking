import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/widgets.dart';

class TodoViewModel extends ViewModel {
  final String name;
  final int id;

  TodoViewModel({@required this.name, @required this.id});

  @override
  List<Object> get props => [id, name];
}
