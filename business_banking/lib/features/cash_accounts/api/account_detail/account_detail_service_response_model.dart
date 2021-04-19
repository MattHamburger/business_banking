// import 'package:business_banking/features/cash_accounts/model/account_detail/account_detail_transaction_details_model.dart';
// import 'package:business_banking/features/cash_accounts/model/account_detail/account_detail_transaction_holds_model.dart';
// import 'package:clean_framework/clean_framework_defaults.dart';
// import 'package:equatable/equatable.dart';
//
// class AccountDetailServiceResponseModel extends Equatable
//     implements JsonResponseModel {
//   final String transactionTitle;
//   final String transactionNumber;
//   final String transactionAmount;
//   final String transactionId;
//   final List<AccountDetailTransactionModel> transactionDetails;
//   final List<AccountDetailsTransactionHoldsModel> transactionHolds;
//
//   AccountDetailServiceResponseModel.fromJson(Map<String, dynamic> json)
//       : transactionTitle = json['transactionTitle'],
//         transactionNumber = json['transactionNumber'] ?? '0',
//         transactionAmount = json['transactionAmount'],
//         transactionId = json['transactionId'] ?? '000000000',
//         transactionDetails = List<AccountDetailTransactionModel>.from(
//               json['transactionDetails']?.map((transactionDetailJSONObject) =>
//                   AccountDetailTransactionModel.fromJson(
//                       transactionDetailJSONObject)),
//             ) ??
//             [],
//         transactionHolds = List<AccountDetailsTransactionHoldsModel>.from(
//               json['transactionHolds']?.map((transactionHoldsJSONObject) =>
//                   AccountDetailsTransactionHoldsModel.fromJson(transactionHoldsJSONObject)),
//             ) ??
//             [];
//
//   @override
//   List<Object> get props => [
//         transactionTitle,
//         transactionNumber,
//         transactionAmount,
//         transactionId,
//         transactionDetails,
//         transactionHolds
//       ];
// }
