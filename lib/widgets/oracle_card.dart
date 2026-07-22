
import 'package:flutter/material.dart';
import '../models/ai_signal.dart';

class OracleCard extends StatelessWidget {
  final AiSignal signal;

  const OracleCard({
    super.key,
    required this.signal,
  });

  Color get signalColor {
    switch (signal.signal) {
      case "BUY":
        return Colors.green;
      case "SELL":
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Card(
        color: const Color(0xFF1E2A38),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Center(
                child: Text(
                  "🤖 GUARDIAN AI ORACLE",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Text(
                "Harga XAUUSD",
                style: TextStyle(color: Colors.grey[400]),
              ),

              Text(
                signal.currentPrice.toStringAsFixed(2),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Divider(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "SIGNAL",
                    style: TextStyle(color: Colors.white70),
                  ),
                  Text(
                    signal.signal,
                    style: TextStyle(
                      color: signalColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Trend",
                      style: TextStyle(color: Colors.white70)),
                  Text(
                    signal.trend,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Confidence",
                      style: TextStyle(color: Colors.white70)),
                  Text(
                    "${signal.confidence}%",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Support",
                      style: TextStyle(color: Colors.white70)),
                  Text(
                    signal.support.toStringAsFixed(2),
                    style: const TextStyle(color: Colors.greenAccent),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Resistance",
                      style: TextStyle(color: Colors.white70)),
                  Text(
                    signal.resistance.toStringAsFixed(2),
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Risk",
                      style: TextStyle(color: Colors.white70)),
                  Text(
                    signal.risk,
                    style: const TextStyle(color: Colors.orange),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                "Recommendation",
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                signal.recommendation,
                style: const TextStyle(
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
