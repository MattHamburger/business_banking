import 'dart:io';

import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_view_model.dart';
import 'package:business_banking/features/mobile_check_deposit/ui/check_deposit_screen_widgets/check_deposit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class CheckPreviewWidget extends StatelessWidget {
  final CheckDepositViewModel _viewModel;
  const CheckPreviewWidget({
    Key key,
    @required File file, @required String type, @required CheckDepositViewModel viewModel
  }) : _file = file, _type = type ,  _viewModel = viewModel , super(key: key);

  final File _file;
  final String _type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.zero,
      height: 150,
      width: 150,
      child: _file != null
          ? Image.file(_file)
          :  Container(
        height: 100.0,
        width: 100.0,
        color: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: new Center(
              child: new Text(_type,
                style: TextStyle(fontSize: 22, color: Colors.white),
                textAlign: TextAlign.center,),
            )),
      ),
    );
  }



  String getBase64OfCheck(File file) {
    String checkBase64;
    Future<String> future = getFileBase64(file);
    future.then((result) {
      print(result);
      checkBase64 = result;
    });
    return checkBase64;
  }

  // void _onClickUpload() {
  //   if(_file != null) {
  //     save(_file);
  //   } else {
  //     print("File is not valid.");
  //   }
  // }

  Future<String> getFileBase64(File file) async {
    List<int> imageBytes = file.readAsBytesSync();
    String base64Image = convert.base64Encode(imageBytes);
    return base64Image;
  }
  
}