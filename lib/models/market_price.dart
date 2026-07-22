class MarketPrice {
  final String symbol;
  final double price;
  final String trend;
  final DateTime lastUpdate;

  const MarketPrice({
    required this.symbol,
    required this.price,
    required this.trend,
    required this.lastUpdate,
  });

  factory MarketPrice.fromJson(Map<String, dynamic> json) {
    return MarketPrice(
      symbol: json['symbol'] ?? 'XAUUSD',
      price: (json['price'] ?? 0).toDouble(),
      trend: json['trend'] ?? 'SIDEWAYS',
      lastUpdate: DateTime.tryParse(json['lastUpdate'] ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'price': price,
      'trend': trend,
      'lastUpdate': lastUpdate.toIso8601String(),
    };
  }

  MarketPrice copyWith({
    String? symbol,
    double? price,
    String? trend,
    DateTime? lastUpdate,
  }) {
    return MarketPrice(
      symbol: symbol ?? this.symbol,
      price: price ?? this.price,
      trend: trend ?? this.trend,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }
}
