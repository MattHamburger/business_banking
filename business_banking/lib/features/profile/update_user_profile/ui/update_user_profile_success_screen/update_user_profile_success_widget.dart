import 'package:business_banking/features/profile/update_user_profile/bloc/update_user_profile_bloc.dart';
import 'package:business_banking/features/profile/update_user_profile/ui/update_user_profile_success_screen/update_user_profile_success_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class UpdateUserProfileSuccessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateUserProfileBloc>(
      create: (_) => UpdateUserProfileBloc(),
      child: UpdateUserProfileSuccessPresenter(),
    );
  }
}
