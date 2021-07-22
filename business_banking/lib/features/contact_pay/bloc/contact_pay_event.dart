import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ContactPayFormEvent extends Equatable {}

class PressSendMoneyButtonEvent extends ContactPayFormEvent {
  final BuildContext context;

  PressSendMoneyButtonEvent(this.context);

  @override
  List<Object> get props => [context];
}

abstract class ContactPayConfirmationEvent extends Equatable {}

class PressOKButtonEvent extends ContactPayConfirmationEvent {
  final BuildContext context;

  PressOKButtonEvent(this.context);

  @override
  List<Object> get props => [context];
}
