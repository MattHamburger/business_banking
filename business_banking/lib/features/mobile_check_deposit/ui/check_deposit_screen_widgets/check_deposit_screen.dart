import 'dart:io';

import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_view_model.dart';
import 'package:camera/camera.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:convert' as convert;

import 'cd_to_accounts_dropdown.dart';
import 'check_preview_widget.dart';

class CheckDepositScreen extends Screen {
  final CheckDepositViewModel viewModel;
  final Function onChangeSelectedToAccount;
  final Function onChangeAmount;
  final Function onChangeDate;
  final Function checkFrontImage;
  final Function checkBackImage;
  final VoidCallback onTapSubmit;

  CheckDepositScreen(
      {@required this.viewModel,
      @required this.onChangeSelectedToAccount,
      @required this.onChangeAmount,
      @required this.onChangeDate,
      @required this.checkFrontImage,
      @required this.checkBackImage,
      @required this.onTapSubmit});

  @override
  Widget build(BuildContext context) {
    return CheckDepositTransactionWidget(
      viewModel: this.viewModel,
      onChangeSelectedToAccount: this.onChangeSelectedToAccount,
      onChangeAmount: this.onChangeAmount,
      onChangeDate: this.onChangeDate,
      checkFrontImage: this.checkFrontImage,
      checkBackImage: this.checkBackImage,
      onTapSubmit: this.onTapSubmit,
    );
  }
}

class CheckDepositTransactionWidget extends StatefulWidget {
  final CheckDepositViewModel viewModel;
  final Function onChangeSelectedToAccount;
  final Function onChangeAmount;
  final Function onChangeDate;
  final Function checkFrontImage;
  final Function checkBackImage;
  final VoidCallback onTapSubmit;

  CheckDepositTransactionWidget(
      {@required this.viewModel,
      @required this.onChangeSelectedToAccount,
      @required this.onChangeAmount,
      @required this.onChangeDate,
      @required this.checkFrontImage,
      @required this.checkBackImage,
      @required this.onTapSubmit});

  @override
  CheckDepositState createState() => CheckDepositState();
}

class CheckDepositState extends State<CheckDepositTransactionWidget> {
  File _fileForFront, _fileForBack;
  String _checkFrontImage, _checkBackImage;
  double _headerHeight = 200.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    _controller.text = widget.viewModel.amount;
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:
            Text('Mobile Check Deposit', key: Key('check_deposit_bar_title')),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: new EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Text(
              'To',
              key: Key('to_label'),
            ),
            width: double.infinity,
          ),
          CDToAccountsDropDown(
              key: Key('to_account_dropdown'),
              viewModel: widget.viewModel,
              onChangeSelectedToAccount: widget.onChangeSelectedToAccount),
          SizedBox(height: 15.0),
          SizedBox(height: 5.0),
          Text('Amount', key: Key('amount_label')),
          SizedBox(height: 15.0),
          TextField(
            key: Key('amount_text_field'),
            onChanged: (String value) {
              widget.onChangeAmount(value);
            },
            keyboardType: TextInputType.number,
            controller: _controller,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
            ],
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: Text('\$ '),
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
            ),
          ),
          SizedBox(height: 20.0),
          Text('Transfer date', key: Key('date_label')),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            key: Key('date_text_field'),
            controller: TextEditingController()
              ..text = DateFormat('MM/dd/yyyy').format(widget.viewModel.date),
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2021))
                  .then((date) {
                widget.onChangeDate(date);
              });
            },
            readOnly: true,
          ),
          SizedBox(height: 15.0),
          Text("Checks"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add_a_photo),
                      onPressed: () {
                        // Navigator.replace(context);
                        _onClickCamera("Front");
                      },
                    ),

                    CheckPreviewWidget(
                        file: _fileForFront, type: "Front Of Check", viewModel: widget.viewModel),
                    // widget.checkFrontImage(getBase64OfCheck(_fileForFront))
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add_a_photo),
                      onPressed: () {
                        _onClickCamera("Back");
                      },
                    ),
                    // widget.checkBackImage(getFileBase64(_fileForBack).toString()),
                    // widget.checkBackImage(getBase64OfCheck(_fileForBack)),
                    CheckPreviewWidget(
                        file: _fileForBack, type: "Back Of Check", viewModel: widget.viewModel),
                  ],
                ),
              ),
            ],
          ),
          RaisedButton(
            key: Key('submit_transfer_button'),
            textColor: Colors.white,
            color: Colors.black54,
            child: Text('Submit'),
            onPressed: () {
              widget.checkFrontImage(_checkFrontImage);
              widget.checkBackImage(_checkBackImage);
              widget.onTapSubmit();
            },
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          )
        ]),
      )),
    );
  }



  void _onClickCamera(String key) async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);
    print("image: $image");
    setState(() {
      if (key == "Front") {
        this._fileForFront = File(image.path);
        getFileBase64(_fileForFront).then((String result){
          setState(() {
            this._checkFrontImage = result;
          });
        });
      } else {
        this._fileForBack = File(image.path);
        getFileBase64(_fileForFront).then((String result){
          setState(() {
            this._checkBackImage = result;
          });
        });
      }
    });
  }

  Future<String> getFileBase64(File file) async {
    List<int> imageBytes = file.readAsBytesSync();
    String base64Image = await convert.base64Encode(imageBytes);
    return base64Image;
  }

  //compress file and get file.
  Future<File> testCompressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 88,
      rotate: 180,
    );

    print(file.lengthSync());
    print(result.lengthSync());

    return result;
  }
}
