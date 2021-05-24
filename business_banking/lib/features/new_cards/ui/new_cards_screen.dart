import 'package:business_banking/features/new_cards/models/new_cards_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class NewCardsScreen extends Screen {
  final NewCardsViewModel viewModel;

  NewCardsScreen({
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: viewModel.allCards!
              .map(
                (item) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.number),
                        Text(item.holder)
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
