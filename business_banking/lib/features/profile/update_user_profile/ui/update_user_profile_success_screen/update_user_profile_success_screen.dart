import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_form_entry/update_user_profile_enums.dart';
import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_success/update_user_profile_success_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class UpdateUserProfileSuccessScreen extends Screen {
  final UpdateUserProfileSuccessViewModel viewModel;
  UpdateUserProfileSuccessScreen({
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    print('success screen');
    print(viewModel.serviceResponseStatus);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: AutoSizeText(
            'User Profile Update',
            maxFontSize: 16,
            minFontSize: 10,
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: viewModel.serviceResponseStatus ==
                UserProfileUpdateResponseStatus.succeed
            ? SuccessWidget(viewModel: viewModel)
            : FailedWidget(viewModel: viewModel));
  }
}

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final UpdateUserProfileSuccessViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 180,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Profile Updated for user ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    viewModel.userName!,
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 40,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class FailedWidget extends StatelessWidget {
  const FailedWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final UpdateUserProfileSuccessViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    print('Failed Widget');
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Unable to update profile for user ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    viewModel.userName!,
                    style: TextStyle(color: Colors.red, fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                      child: Column(children: [
                    Image.asset(
                      'assets/images/server_error.png',
                      height: 300,
                      width: 400,
                    )
                  ])),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      )),
    );
  }
}
