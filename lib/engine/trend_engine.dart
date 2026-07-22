class TrendEngine {
  const TrendEngine();

  String analyze({
    required double currentPrice,
    required double support,
    required double resistance,
  }) {
    if (currentPrice > resistance) {
      return "Bullish";
    }

    if (currentPrice < support) {
      return "Bearish";
    }

    return "Sideways";
  }
}
