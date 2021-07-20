import 'package:business_banking/features/investments/model/quote.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class InvestmentsJsonResponseModel extends JsonResponseModel {
  final Quote quote;

  InvestmentsJsonResponseModel(this.quote);

  InvestmentsJsonResponseModel.fromJson(Map<String, dynamic> json)
      : quote = new Quote.fromJson(json);

  @override
  // implement props
  List<Object?> get props => [quote];

  @override
  // implement stringify
  bool get stringify => false;
}
