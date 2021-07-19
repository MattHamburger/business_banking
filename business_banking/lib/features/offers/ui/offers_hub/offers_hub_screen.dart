import 'dart:ui';

import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../model/offers_view_model.dart';
import 'offers_hub_actions.dart';

class OffersHubScreen extends Screen {
  final OffersViewModel viewModel;
  final OffersHubActions actions;

  OffersHubScreen({required this.viewModel, required this.actions});

  @override
  Widget build(BuildContext context) {
    return viewModel.serviceResponseStatus == ServiceResponseStatus.succeed
        ? _OffersHeader(
            key: const Key('OffersHub-success'),
            viewModel: viewModel,
            pressenterActions: actions,
          )
        : const SizedBox(key: Key('OffersHub-failure'));
  }
}

class _OffersHeader extends StatelessWidget {
  const _OffersHeader({
    Key? key,
    required this.viewModel,
    required this.pressenterActions,
  }) : super(key: key);

  final OffersViewModel viewModel;
  final OffersHubActions pressenterActions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: OfferCard(viewModel: viewModel),
      onTap: () => pressenterActions.navigateToOffersList(context),
    );
  }
}

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final OffersViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: const Text(
                  'Special Offers',
                  key: const Key('OffersHub-success-title'),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Divider(
                key: const Key('OffersHub-success-divider'),
                thickness: 2,
              ),
              Text(
                "Limited-time offers that will help you maximize savings, "
                "earn reward points, enjoy additional benefits and more.",
                key: const Key('OffersHub-success-description'),
                style: TextStyle(color: Colors.black54, fontSize: 15),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
