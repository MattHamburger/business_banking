import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TodoViewModel extends ViewModel {
  final int count;

  TodoViewModel({
    @required this.count,
  }); //assertions not required when @required syntax used...right?

  @override
  List<Object> get props => [count];
}