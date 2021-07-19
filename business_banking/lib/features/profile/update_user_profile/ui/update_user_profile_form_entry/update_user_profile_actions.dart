import 'package:business_banking/features/profile/update_user_profile/bloc/update_user_profile_bloc.dart';
import 'package:business_banking/features/profile/update_user_profile/bloc/update_user_profile_form_entry/update_user_profile_event.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateUserProfileRequestActions {
  UpdateUserProfileRequestActions(this.bloc);
  final UpdateUserProfileBloc bloc;

  void onPressUpdateProfileButton(
    BuildContext context,
    String userName,
    String phoneNumber,
    String email,
    String address,
  ) {
    String phoneNumberValidated = bloc.validatePhoneNumber(phoneNumber);
    String addressValidated = bloc.validateAddress(address);
    String emailValidated = bloc.validateEmail(email);

    if (phoneNumberValidated.isNotEmpty ||
        emailValidated.isNotEmpty ||
        addressValidated.isNotEmpty) {
      showDialogWithContent(context, "Invalid Information!",
          "Please fill in all fields properly");
      return;
    } else {
      CFRouterScope.of(context)
          .replaceWith(BusinessBankingRouter.NewSuccessScreen);
    }
  }

  void onUpdatePhoneNumber(String phoneNumber) {
    var event = UpdatePhoneNumberRequestEvent(phoneNumber);
    bloc.updateUserProfileEventsPipe.send(event);
  }

  void onUpdateEmail(String email) {
    var event = UpdateAddressRequestEvent(email);
    bloc.updateUserProfileEventsPipe.send(event);
  }

  void onUpdateAddress(String address) {
    var event = UpdateAddressRequestEvent(address);
    bloc.updateUserProfileEventsPipe.send(event);
  }

  void showDialogWithContent(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
