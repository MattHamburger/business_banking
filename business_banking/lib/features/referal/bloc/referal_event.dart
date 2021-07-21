import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ReferalEvent extends Equatable {}

class ReferalButtonEvent extends ReferalEvent {
  final BuildContext context;

  ReferalButtonEvent(this.context);

  @override
  List<Object> get props => [context];
}
