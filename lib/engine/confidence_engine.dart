import '../models/market_context.dart';

class ConfidenceEngine {
  const ConfidenceEngine();

  int analyze({
    required String trend,
    required MarketContext context,
  }) {
    int confidence = 50;

    if (trend == "Bullish" || trend == "Bearish") {
      confidence += 20;
    }

    if (context.rsi > 55 && context.rsi < 70) {
      confidence += 10;
    }

    if (!context.highImpactNews) {
      confidence += 10;
    }

    if (confidence > 95) {
      confidence = 95;
    }

    return confidence;
  }
}
