import 'package:business_banking/dependency/package_info_plugin.dart';
import 'package:business_banking/features/profile/update_user_profile/bloc/update_user_profile_form_entry/update_user_profile_event.dart';
import 'package:business_banking/features/profile/update_user_profile/bloc/update_user_profile_form_entry/update_user_profile_usecase.dart';
import 'package:business_banking/features/profile/update_user_profile/bloc/update_user_profile_success/update_user_profile_success_usecase.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_form_entry/update_user_profile_view_model.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_success/update_user_profile_success_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class UpdateUserProfileBloc extends Bloc {
  final updateUserProfileEventsPipe =
      Pipe<UpdateUserProfileEvent>(canSendDuplicateData: true);

  UpdateUserProfileUseCase? _updateUserProfileUseCase;
  final updateUserProfileViewModelPipe = Pipe<UpdateUserProfileViewModel>();

  UpdateUserProfileSuccessUseCase? _updateUserProfileSuccessUseCase;
  final updateUserProfileSuccessViewModelPipe =
      Pipe<UpdateUserProfileSuccessViewModel>();

  UpdateUserProfileBloc({
    UpdateUserProfileUseCase? updateUserProfileUseCase,
    UpdateUserProfileSuccessUseCase? updateUserProfileSuccessUseCase,
  }) {
    updateUserProfileEventsPipe.receive.listen((event) {
      updateUserProfileEventsPipeHandler(event);
    });
    _updateUserProfileUseCase = updateUserProfileUseCase ??
        UpdateUserProfileUseCase(
            (viewModel) => updateUserProfileViewModelPipe
                .send(viewModel as UpdateUserProfileViewModel),
            PackageInfoPlugin());
    updateUserProfileViewModelPipe
        .whenListenedDo(_updateUserProfileUseCase!.create);

    _updateUserProfileSuccessUseCase = updateUserProfileSuccessUseCase ??
        UpdateUserProfileSuccessUseCase((viewModel) =>
            updateUserProfileSuccessViewModelPipe
                .send(viewModel as UpdateUserProfileSuccessViewModel));
    updateUserProfileSuccessViewModelPipe
        .whenListenedDo(_updateUserProfileSuccessUseCase!.create);
  }

  @override
  void dispose() {
    updateUserProfileEventsPipe.dispose();
    updateUserProfileViewModelPipe.dispose();
    updateUserProfileSuccessViewModelPipe.dispose();
  }

  updateUserProfileEventsPipeHandler(UpdateUserProfileEvent event) {
    if (event is UpdateEmailRequestEvent) {
      _updateUserProfileUseCase!.updateEmail(event.email);
      return;
    } else if (event is UpdatePhoneNumberRequestEvent) {
      _updateUserProfileUseCase!.updatePhoneNumber(event.phoneNumber);
      return;
    } else if (event is UpdateAddressRequestEvent) {
      _updateUserProfileUseCase!.updateEmail(event.address);
      return;
    }
  }

  String validatePhoneNumber(String phoneNumber) {
    return _updateUserProfileUseCase!.validatePhoneNumber(phoneNumber);
  }

  String validateAddress(String password) {
    return _updateUserProfileUseCase!.validateUserAddress(password);
  }

  String validateEmail(String email) {
    return _updateUserProfileUseCase!.validateEmail(email);
  }
}
