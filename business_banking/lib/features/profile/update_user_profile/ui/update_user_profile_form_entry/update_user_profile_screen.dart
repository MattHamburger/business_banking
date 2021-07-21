import 'package:business_banking/features/profile/update_user_profile/model/update_user_profile_form_entry/update_user_profile_view_model.dart';
import 'package:business_banking/features/profile/update_user_profile/ui/update_user_profile_form_entry/update_user_profile_actions.dart';
import 'package:business_banking/utils/card_number_formatter.dart';
import 'package:business_banking/utils/phone_number_formatter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdateUserProfileScreen extends Screen {
  final UpdateUserProfileViewModel viewModel;
  final UpdateUserProfileRequestActions actions;

  UpdateUserProfileScreen({
    required this.viewModel,
    required this.actions,
  });

  final _form = GlobalKey<FormState>();

  final _nameValueTextEditingController = TextEditingController();
  final _phoneNumberTextEditingController = TextEditingController();
  final _userEmailAddressController = TextEditingController();
  final _addressTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameValueTextEditingController.text = viewModel.userName!;
    _phoneNumberTextEditingController.text = viewModel.phoneNumber!;
    _userEmailAddressController.text = viewModel.email!;
    _addressTextEditingController.text = viewModel.address!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.withOpacity(0.7),
        title: Text(
          'Update your profile',
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 5.0),
              child: Form(
                key: _form,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('UserId:PA1234'),
                      customTextField(
                        textFieldKey: Key('phoneNumber-TxtField'),
                        controller: _phoneNumberTextEditingController,
                        inputStatus: viewModel.phoneNumberStatus,
                        labelText: 'Phone Number',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        onSaved: (val) {
                          actions.onUpdatePhoneNumber(val!);
                        },
                      ),
                      customTextField(
                        textFieldKey: Key('email-TxtField'),
                        controller: _userEmailAddressController,
                        inputStatus: viewModel.userEmailStatus,
                        labelText: 'Email',
                        hintText: 'user@email.com',
                        onSaved: (val) {
                          actions.onUpdateEmail(val!);
                        },
                      ),
                      customTextField(
                        textFieldKey: Key('address-TxtField'),
                        controller: _addressTextEditingController,
                        inputStatus: viewModel.addressStatus,
                        labelText: 'Address',
                        onSaved: (val) {
                          actions.onUpdateAddress(val!);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              key: Key("createButton"),
                              style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 18),
                                  primary: Colors.green.withOpacity(0.7)),
                              onPressed: () async {
                                _form.currentState!.save();
                                actions.onPressUpdateProfileButton(
                                    context,
                                    _nameValueTextEditingController.text,
                                    _phoneNumberTextEditingController.text,
                                    _userEmailAddressController.text,
                                    _addressTextEditingController.text);
                              },
                              child: Text('Update Profile',
                                  style: TextStyle(fontSize: 20.0))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget customTextField({
    TextEditingController? controller,
    String? labelText,
    String hintText = '',
    final FormFieldSetter<String>? onSaved,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    final String? inputStatus,
    List<TextInputFormatter>? inputFormatters,
    Key? textFieldKey,
  }) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextFormField(
          key: textFieldKey,
          controller: controller,
          inputFormatters: inputFormatters ?? <TextInputFormatter>[],
          //viewModel.paymentValueTextEditingController,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixStyle: TextStyle(color: Colors.orangeAccent),
              labelText: labelText,
              hintText: hintText),

          textInputAction: TextInputAction.done,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onSaved: onSaved,
        ),
      ),
      checkInputStatus(inputStatus),
    ]);
  }

  Widget checkInputStatus(
    String? inputStatus,
  ) {
    if (inputStatus!.isNotEmpty) {
      return Padding(
          padding: EdgeInsets.only(left: 15, bottom: 10),
          child: Row(children: [
            Expanded(
                child: Text(
              inputStatus,
              style: TextStyle(color: Colors.red, fontSize: 12),
            )),
          ]));
    } else {
      return Container();
    }
  }
}
