class SupportResistanceEngine {
  const SupportResistanceEngine();

  double support({
    required double currentPrice,
  }) {
    return currentPrice - 10;
  }

  double resistance({
    required double currentPrice,
  }) {
    return currentPrice + 10;
  }
}
