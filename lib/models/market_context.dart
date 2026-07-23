class MarketContext {
  final double currentPrice;
  final double support;
  final double resistance;

  final double ema20;
  final double ema50;

  final double rsi;
  final double atr;

  final bool highImpactNews;

  const MarketContext({
    required this.currentPrice,
    required this.support,
    required this.resistance,
    required this.ema20,
    required this.ema50,
    required this.rsi,
    required this.atr,
    required this.highImpactNews,
  });

  MarketContext copyWith({
    double? currentPrice,
    double? support,
    double? resistance,
    double? ema20,
    double? ema50,
    double? rsi,
    double? atr,
    bool? highImpactNews,
  }) {
    return MarketContext(
      currentPrice: currentPrice ?? this.currentPrice,
      support: support ?? this.support,
      resistance: resistance ?? this.resistance,
      ema20: ema20 ?? this.ema20,
      ema50: ema50 ?? this.ema50,
      rsi: rsi ?? this.rsi,
      atr: atr ?? this.atr,
      highImpactNews: highImpactNews ?? this.highImpactNews,
    );
  }
}
