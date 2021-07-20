import 'package:clean_framework/clean_framework.dart';

class InvestmentsViewModel extends ViewModel {
  final String? askPrice;
  final int? askSize;
  final String? bidPrice;
  final int? bidSize;
  final String? lastTradePrice;
  final String? lastExtendedHoursTradePrice;
  final String? previousClose;
  final String? adjustedPreviousClose;
  final String? previousCloseDate;
  final String? symbol;
  final bool? tradingHalted;
  final bool? hasTraded;
  final String? lastTradePriceSource;
  final String? updatedAt;
  final String? instrument;
  final String? instrumentId;

  InvestmentsViewModel(
      {required this.askPrice,
      required this.askSize,
      required this.bidPrice,
      required this.bidSize,
      required this.lastTradePrice,
      this.lastExtendedHoursTradePrice,
      this.previousClose,
      this.adjustedPreviousClose,
      this.previousCloseDate,
      this.symbol,
      this.tradingHalted,
      this.hasTraded,
      this.lastTradePriceSource,
      this.updatedAt,
      this.instrument,
      this.instrumentId});

  @override
  // TODO: implement props
  List<Object?> get props => [
        bidSize!,
        askSize!,
        bidPrice!,
        lastTradePrice!,
        lastExtendedHoursTradePrice!,
        previousClose!,
        adjustedPreviousClose!,
        previousCloseDate!,
        symbol!,
        tradingHalted!,
        hasTraded!,
        lastTradePriceSource!,
        updatedAt!,
        instrument!,
        instrumentId!
      ];
}
