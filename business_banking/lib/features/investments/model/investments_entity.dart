import 'package:clean_framework/clean_framework.dart';

class InvestmentsEntity extends Entity {
  String? askPrice;
  int? askSize;
  String? bidPrice;
  int? bidSize;
  String? lastTradePrice;
  String? lastExtendedHoursTradePrice;
  String? previousClose;
  String? adjustedPreviousClose;
  String? previousCloseDate;
  String? symbol;
  bool? tradingHalted;
  bool? hasTraded;
  String? lastTradePriceSource;
  String? updatedAt;
  String? instrument;
  String? instrumentId;

  InvestmentsEntity(
      {List<EntityFailure> errors = const [],
      String? askPrice,
      String? askSize,
      int? bidSize,
      String? bidPrice,
      String? lastTradePrice,
      String? lastExtendedHoursTradePrice,
      String? previousClose,
      String? adjustedPreviousClose,
      String? previousCloseDate,
      String? symbol,
      bool? tradingHalted,
      bool? hasTraded,
      String? lastTradePriceSource,
      String? updatedAt,
      String? instrument,
      String? instrumentId})
      : super(errors: errors);

  @override
  List<Object> get props => [
        errors,
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

  @override
  InvestmentsEntity merge({
    errors,
    askPrice,
    askSize,
    bidPrice,
    bidSize,
    lastTradePrice,
    lastExtendedHoursTradePrice,
    previousClose,
    adjustedPreviousClose,
    previousCloseDate,
    symbol,
    tradingHalted,
    hasTraded,
    lastTradePriceSource,
    updatedAt,
    instrument,
    instrumentId,
  }) {
    return InvestmentsEntity(
      errors: errors ?? this.errors,
      askPrice: askPrice ?? this.askPrice,
      askSize: askSize ?? this.askSize,
      bidPrice: bidPrice ?? this.bidPrice,
      bidSize: bidSize ?? this.bidSize,
      lastTradePrice: lastTradePrice ?? this.lastTradePrice,
      lastExtendedHoursTradePrice:
          lastExtendedHoursTradePrice ?? this.lastExtendedHoursTradePrice,
      previousClose: previousClose ?? this.previousClose,
      adjustedPreviousClose:
          adjustedPreviousClose ?? this.adjustedPreviousClose,
      previousCloseDate: previousCloseDate ?? this.previousCloseDate,
      symbol: symbol ?? this.symbol,
      tradingHalted: tradingHalted ?? this.tradingHalted,
      hasTraded: hasTraded ?? this.hasTraded,
      lastTradePriceSource: lastTradePriceSource ?? this.lastTradePriceSource,
      updatedAt: updatedAt ?? this.updatedAt,
      instrument: instrument ?? this.instrument,
      instrumentId: instrumentId ?? this.instrumentId,
    );
  }
}
