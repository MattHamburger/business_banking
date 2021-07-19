import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class ReferalViewModel extends ViewModel {
  final String email;
  final double amount;

  ReferalViewModel({required this.email, required this.amount});

  List<Object?> get props => [email, amount];
}
