import '../engine/confidence_engine.dart';
import '../engine/risk_engine.dart';
import '../engine/signal_engine.dart';
import '../engine/support_resistance_engine.dart';
import '../engine/trend_engine.dart';

import '../models/ai_signal.dart';
import '../models/market_context.dart';

class AiOracleService {
  const AiOracleService();

  Future<AiSignal> analyze(double currentPrice) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    const supportResistanceEngine = SupportResistanceEngine();

    final support = supportResistanceEngine.support(
      currentPrice: currentPrice,
    );

    final resistance = supportResistanceEngine.resistance(
      currentPrice: currentPrice,
    );

    final context = MarketContext(
      currentPrice: currentPrice,
      support: support,
      resistance: resistance,
      ema20: currentPrice,
      ema50: currentPrice,
      rsi: 60,
      atr: 15,
      highImpactNews: false,
    );

    const trendEngine = TrendEngine();
    final trend = trendEngine.analyze(context);

    const confidenceEngine = ConfidenceEngine();
    final confidence = confidenceEngine.analyze(
      trend: trend,
      context: context,
    );

    const signalEngine = SignalEngine();
    final signal = signalEngine.analyze(
      trend: trend,
      confidence: confidence,
      context: context,
    );

    const riskEngine = RiskEngine();
    final risk = riskEngine.analyze(
      confidence: confidence,
    );

    String recommendation;

    switch (signal) {
      case "BUY":
        recommendation =
            "Trend bullish dengan confidence tinggi. Pertimbangkan BUY sesuai manajemen risiko.";
        break;

      case "SELL":
        recommendation =
            "Trend bearish dengan confidence tinggi. Pertimbangkan SELL sesuai manajemen risiko.";
        break;

      default:
        recommendation =
            "Belum ada sinyal kuat. Tunggu konfirmasi berikutnya.";
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
