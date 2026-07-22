class SignalEngine {
  const SignalEngine();

  String analyze({
    required String trend,
    required int confidence,
    required double currentPrice,
    required double support,
    required double resistance,
  }) {
    if (trend == "Bullish" &&
        confidence >= 80 &&
        currentPrice > resistance) {
      return "BUY";
    }

    if (trend == "Bearish" &&
        confidence >= 80 &&
        currentPrice < support) {
      return "SELL";
    }

    return "HOLD";
  }
}
