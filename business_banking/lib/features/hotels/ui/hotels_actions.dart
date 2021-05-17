import 'package:business_banking/features/hotels/bloc/hotels_bloc.dart';
import 'package:business_banking/features/hotels/model/hotel_view_model.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class HotelsActions {
  HotelsBloc bloc;

  HotelsActions({required this.bloc});

  void navigateToHotels(BuildContext context) {
    context.router.push(BusinessBankingRouter.hotelsRoute);
  }

  void hotelClicked(HotelViewModel viewModel) {
    bloc.hotelLiked(viewModel);
  }
}
