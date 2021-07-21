import 'package:business_banking/features/profile/update_user_profile/bloc/update_user_profile_bloc.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_success/update_user_profile_success_view_model.dart';
import 'package:business_banking/features/profile/update_user_profile/ui/update_user_profile_success_screen/update_user_profile_success_screen.dart';
import 'package:business_banking/features/profile/update_user_profile/ui/widgets/custom_circular_progress_bar_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class UpdateUserProfileSuccessPresenter extends Presenter<UpdateUserProfileBloc,
    UpdateUserProfileSuccessViewModel, UpdateUserProfileSuccessScreen> {
  @override
  Stream<UpdateUserProfileSuccessViewModel> getViewModelStream(
      UpdateUserProfileBloc bloc) {
    return bloc.updateUserProfileSuccessViewModelPipe.receive;
  }

  @override
  UpdateUserProfileSuccessScreen buildScreen(
      BuildContext context,
      UpdateUserProfileBloc bloc,
      UpdateUserProfileSuccessViewModel viewModel) {
    return UpdateUserProfileSuccessScreen(
      viewModel: viewModel,
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return CustomCircularProgressBar();
  }
}
