class SupportResistanceEngine {
  const SupportResistanceEngine();

  double support({
    required double currentPrice,
    double distance = 10.0,
  }) {
    return currentPrice - distance;
  }

  double resistance({
    required double currentPrice,
    double distance = 10.0,
  }) {
    return currentPrice + distance;
  }
}
