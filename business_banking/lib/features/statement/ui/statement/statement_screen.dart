import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/statement/model/statement/statement_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'statement_presenter.dart';

class StatementScreen extends Screen {
  final StatementViewModel viewModel;
  final StatementPresenterActions presenterActions;

  StatementScreen({
    required this.viewModel,
    required this.presenterActions,
  });

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      if (viewModel.emailServiceStatus == EmailServiceStatus.initial) {
        return;
      } else if (viewModel.emailServiceStatus == EmailServiceStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("There was an error sending your email."),
        ));
      } else if (viewModel.emailServiceStatus == EmailServiceStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Your email was successfully sent."),
        ));
      }
    });

    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: GestureDetector(
          child: Icon(
            Icons.chevron_left,
            size: 40.0,
          ),
          onTap: () {
            presenterActions.navigateBackToHub(context);
          },
          key: Key('Statement-Back-Button'),
        ),
        title: AutoSizeText(
          'Your Statements',
          maxFontSize: 16,
          minFontSize: 10,
        ),
      ),
      body: ListView.separated(
          itemCount: viewModel.statements.length,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (context, index) {
            return Container(
              height: 300,
              child: Card(
                color: Colors.green[200],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            viewModel
                                .statements[index].accountInfo.accountNickname,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Balance',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                        key: Key('statementListView'),
                        shrinkWrap: true,
                        itemCount: viewModel
                            .statements[index].statementActivity.length,
                        itemBuilder: (context, innerIndex) {
                          return Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(viewModel.statements[index]
                                  .statementActivity[innerIndex].date
                                  .substring(0, 10)),
                              subtitle: Text(viewModel.statements[index]
                                  .statementActivity[innerIndex].description),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(viewModel.statements[index]
                                      .statementActivity[innerIndex].balance
                                      .toStringAsFixed(2)),
                                  SizedBox(height: 5),
                                  viewModel
                                              .statements[index]
                                              .statementActivity[innerIndex]
                                              .additions !=
                                          null
                                      ? Text(
                                          '+' +
                                              viewModel
                                                  .statements[index]
                                                  .statementActivity[innerIndex]
                                                  .additions!
                                                  .toStringAsFixed(2),
                                          style: TextStyle(color: Colors.green),
                                        )
                                      : Text(
                                          '-' +
                                              viewModel
                                                  .statements[index]
                                                  .statementActivity[innerIndex]
                                                  .subtractions!
                                                  .toStringAsFixed(2),
                                          style: TextStyle(color: Colors.red))
                                ],
                              ),
                            ),
                          );
                        }),
                    IconButton(
                      icon: Icon(Icons.email),
                      onPressed: () => presenterActions.sendStatementToEmail(
                          context, viewModel.statements[index]),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
