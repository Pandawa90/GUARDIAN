class RiskEngine {
  const RiskEngine();

  String analyze({
    required int confidence,
  }) {
    if (confidence >= 85) {
      return "LOW";
    }

    if (confidence >= 70) {
      return "MEDIUM";
    }

    return "HIGH";
  }
}
