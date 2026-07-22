class ConfidenceEngine {
  const ConfidenceEngine();

  int analyze({
    required String trend,
    required double currentPrice,
    required double support,
    required double resistance,
  }) {
    int confidence = 60;

    if (trend == "Bullish") {
      confidence += 20;
    } else if (trend == "Bearish") {
      confidence += 20;
    }

    final distanceToResistance =
        (resistance - currentPrice).abs();

    final distanceToSupport =
        (currentPrice - support).abs();

    if (distanceToResistance < 3 ||
        distanceToSupport < 3) {
      confidence += 10;
    }

    if (confidence > 100) {
      confidence = 100;
    }

    return confidence;
  }
}
