import 'package:business_banking/features/profile/update_user_profile/bloc/update_user_profile_bloc.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_form_entry/update_user_profile_enums.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_form_entry/update_user_profile_view_model.dart';
import 'package:business_banking/features/profile/update_user_profile/ui/update_user_profile_form_entry/update_user_profile_actions.dart';
import 'package:business_banking/features/profile/update_user_profile/ui/update_user_profile_form_entry/update_user_profile_screen.dart';
import 'package:business_banking/features/profile/update_user_profile/ui/widgets/custom_circular_progress_bar_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class UpdateUserProfileRequestPresenter extends Presenter<UpdateUserProfileBloc,
    UpdateUserProfileViewModel, UpdateUserProfileScreen> {
  @override
  Stream<UpdateUserProfileViewModel> getViewModelStream(
      UpdateUserProfileBloc bloc) {
    return bloc.updateUserProfileViewModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return CustomCircularProgressBar();
  }

  @override
  UpdateUserProfileScreen buildScreen(BuildContext context,
      UpdateUserProfileBloc bloc, UpdateUserProfileViewModel viewModel) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      if (viewModel.serviceResponseStatus ==
          UserProfileUpdateResponseStatus.succeed) {
        return;
      } else if (viewModel.serviceResponseStatus ==
          UserProfileUpdateResponseStatus.failed) {
        UpdateUserProfileRequestActions(bloc)
            .showDialogWithContent(context, "Errors!", 'Submission failed');
      }
    });

    return UpdateUserProfileScreen(
      viewModel: viewModel,
      actions: UpdateUserProfileRequestActions(bloc),
    );
  }
}
