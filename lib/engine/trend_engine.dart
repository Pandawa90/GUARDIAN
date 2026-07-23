	import '../models/market_context.dart';

class TrendEngine {
  const TrendEngine();

  String analyze(MarketContext context) {
    if (context.currentPrice > context.resistance) {
      return "Bullish";
    }

    if (context.currentPrice < context.support) {
      return "Bearish";
    }

    return "Sideways";
  }
}
