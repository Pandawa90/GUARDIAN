import '../models/market_context.dart';

class SignalEngine {
  const SignalEngine();

  String analyze({
    required String trend,
    required int confidence,
    required MarketContext context,
  }) {
    if (trend == "Bullish" &&
        confidence >= 80 &&
        context.currentPrice > context.ema20) {
      return "BUY";
    }

    if (trend == "Bearish" &&
        confidence >= 80 &&
        context.currentPrice < context.ema20) {
      return "SELL";
    }

    return "WAIT";
  }
}
