import 'package:flutter/material.dart';

import '../models/ai_signal.dart';
import '../models/market_price.dart';

import '../services/market_service.dart';
import '../services/ai_oracle_service.dart';

import '../widgets/oracle_card.dart';

class AiOracleScreen extends StatefulWidget {
  const AiOracleScreen({super.key});

  @override
  State<AiOracleScreen> createState() => _AiOracleScreenState();
}

class _AiOracleScreenState extends State<AiOracleScreen> {
  final MarketService marketService = MarketService();
  final AiOracleService oracleService = AiOracleService();

  late Future<AiSignal> futureSignal;

  Future<AiSignal> loadSignal() async {
    final MarketPrice price = await marketService.getLivePrice();
    return oracleService.analyze(price.price);
  }

  @override
  void initState() {
    super.initState();
    futureSignal = loadSignal();
  }

  void refreshAnalysis() {
    setState(() {
      futureSignal = loadSignal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101820),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101820),
        foregroundColor: Colors.white,
        title: const Text("AI Oracle"),
      ),
      body: FutureBuilder<AiSignal>(
        future: futureSignal,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: OracleCard(
                  signal: snapshot.data!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: refreshAnalysis,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Refresh Analysis"),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
