import 'package:business_banking/features/profile/update_user_profile/bloc/update_user_profile_bloc.dart';
import 'package:business_banking/features/profile/update_user_profile/ui/update_user_profile_form_entry/update_user_profile_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class UpdateUserProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdateUserProfileBloc(),
      child: UpdateUserProfileRequestPresenter(),
    );
  }
}
