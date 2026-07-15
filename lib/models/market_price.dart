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
}
