import '../engine/confidence_engine.dart';
import '../engine/risk_engine.dart';
import '../engine/signal_engine.dart';
import '../engine/support_resistance_engine.dart';
import '../engine/trend_engine.dart';
import '../models/ai_signal.dart';

class AiOracleService {
  final TrendEngine trendEngine = const TrendEngine();
  final SupportResistanceEngine supportResistanceEngine =
      const SupportResistanceEngine();
  final ConfidenceEngine confidenceEngine =
      const ConfidenceEngine();
  final SignalEngine signalEngine = const SignalEngine();
  final RiskEngine riskEngine = const RiskEngine();

  Future<AiSignal> analyze(double currentPrice) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    final support = supportResistanceEngine.support(
      currentPrice: currentPrice,
    );

    final resistance = supportResistanceEngine.resistance(
      currentPrice: currentPrice,
    );

    final trend = trendEngine.analyze(
      currentPrice: currentPrice,
      support: support,
      resistance: resistance,
    );

    final confidence = confidenceEngine.analyze(
      trend: trend,
      currentPrice: currentPrice,
      support: support,
      resistance: resistance,
    );

    final signal = signalEngine.analyze(
      trend: trend,
      confidence: confidence,
      currentPrice: currentPrice,
      support: support,
      resistance: resistance,
    );

    final risk = riskEngine.analyze(
      confidence: confidence,
    );

    String recommendation;

    switch (signal) {
      case "BUY":
        recommendation =
            "Trend bullish dengan confidence tinggi. Pertimbangkan entry BUY sesuai manajemen risiko.";
        break;

      case "SELL":
        recommendation =
            "Trend bearish dengan confidence tinggi. Pertimbangkan entry SELL sesuai manajemen risiko.";
        break;

      default:
        recommendation =
            "Belum ada sinyal yang kuat. Tunggu konfirmasi berikutnya.";
    }

    return AiSignal(
      currentPrice: currentPrice,
      signal: signal,
      trend: trend,
      confidence: confidence,
      support: support,
      resistance: resistance,
      recommendation: recommendation,
      risk: risk,
    );
  }
}
