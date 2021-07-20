class Quote {
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

  Quote({
    required this.askPrice,
    required this.askSize,
    required this.bidPrice,
    required this.bidSize,
    required this.lastTradePrice,
    required this.lastExtendedHoursTradePrice,
    required this.previousClose,
    required this.adjustedPreviousClose,
    required this.previousCloseDate,
    required this.symbol,
    required this.tradingHalted,
    required this.hasTraded,
    required this.lastTradePriceSource,
    required this.updatedAt,
    required this.instrument,
    required this.instrumentId,
  });

  Quote.fromJson(Map<String, dynamic> json)
      : askPrice = json['ask_price'] ?? '',
        askSize = json['ask_size'] ?? 0,
        bidPrice = json['bid_price'] ?? '',
        bidSize = json['bid_size'] ?? 0,
        lastTradePrice = json['last_trade_price'] ?? '',
        lastExtendedHoursTradePrice =
            json['last_extended_hours_trade_price'] ?? '',
        previousClose = json['previous_close'] ?? '',
        adjustedPreviousClose = json['adjusted_previous_close'] ?? '',
        previousCloseDate = json['previous_close_date'] ?? '',
        symbol = json['symbol'] ?? '',
        tradingHalted = json['trading_halted'] ?? false,
        hasTraded = json['has_traded'] ?? false,
        lastTradePriceSource = json['last_trade_price_source'] ?? '',
        updatedAt = json['updated_at'] ?? '',
        instrument = json['instrument'] ?? '',
        instrumentId = json['instrument_id'] ?? '';
}
