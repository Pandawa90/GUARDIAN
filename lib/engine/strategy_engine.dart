enum TradingStrategy {
  scalping,
  intraday,
  swing,
}

class StrategyEngine {
  const StrategyEngine();

  double stopLoss({
    required double currentPrice,
    required TradingStrategy strategy,
  }) {
    switch (strategy) {
      case TradingStrategy.scalping:
        return currentPrice - 5;

      case TradingStrategy.intraday:
        return currentPrice - 10;

      case TradingStrategy.swing:
        return currentPrice - 25;
    }
  }

  double takeProfit({
    required double currentPrice,
    required TradingStrategy strategy,
  }) {
    switch (strategy) {
      case TradingStrategy.scalping:
        return currentPrice + 10;

      case TradingStrategy.intraday:
        return currentPrice + 20;

      case TradingStrategy.swing:
        return currentPrice + 50;
    }
  }
}
