import 'dart:ui';

import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../model/offers_view_model.dart';
import 'offers_list_actions.dart';

class OffersListScreen extends Screen {
  final OffersViewModel viewModel;
  final OffersListActions actions;

  OffersListScreen({required this.viewModel, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: GestureDetector(
          child: Icon(
            Icons.chevron_left,
            size: 40.0,
          ),
          onTap: () => actions.navigateBack(context),
          key: Key('OffersList-appbar-back-button'),
        ),
        title: Text(
          'Special Offers',
          key: Key('OffersList-appbar-title'),
        ),
      ),
      body: viewModel.serviceResponseStatus == ServiceResponseStatus.succeed
          ? _Offers(
              key: Key('OffersList-success'),
              viewModel: viewModel,
              actions: actions,
            )
          : _FailureCard(
              key: Key('OffersList-failure'),
              actions: actions,
            ),
    );
  }
}

class _Offers extends StatelessWidget {
  const _Offers({
    Key? key,
    required this.viewModel,
    required this.actions,
  }) : super(key: key);

  final OffersViewModel viewModel;
  final OffersListActions actions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewModel.offers.length,
      itemBuilder: (context, index) {
        return _OfferCard(
          index: index,
          offer: viewModel.offers[index],
          actions: actions,
        );
      },
    );
  }
}

class _OfferCard extends StatelessWidget {
  const _OfferCard({
    Key? key,
    required this.index,
    required this.offer,
    required this.actions,
  }) : super(key: key);

  final int index;
  final String offer;
  final OffersListActions actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  'Special Offer #${index + 1}',
                  key: Key('OffersList-success-offer-title-${index + 1}'),
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Divider(
                key: Key('OffersList-success-offer-divider-${index + 1}'),
                thickness: 2,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  offer,
                  key: Key('OffersList-success-offer-description-${index + 1}'),
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Please consult your local branch if you need help with this offer.',
                  key: Key('OffersList-success-offer-disclaimer-${index + 1}'),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FailureCard extends StatelessWidget {
  const _FailureCard({
    Key? key,
    required this.actions,
  }) : super(key: key);

  final OffersListActions actions;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => actions.navigateBack(context),
      child: Container(
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
                  child: Row(
                    children: [
                      Icon(
                        Icons.error,
                        key: Key('OffersList-failure-icon'),
                        size: 36.0,
                        color: Colors.red[400],
                      ),
                      const SizedBox(width: 5.0),
                      const Text(
                        'Error',
                        key: Key('OffersList-failure-title'),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  key: Key('OffersList-failure-divider'),
                  thickness: 2,
                ),
                Text(
                  'Service is not available at this time! Please try again '
                  'later.',
                  key: Key('OffersList-failure-description'),
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
