import 'package:flutter/material.dart';
import '../models/market_price.dart';

class PriceCard extends StatelessWidget {
  final MarketPrice marketPrice;

  const PriceCard({
    super.key,
    required this.marketPrice,
  });

  @override
  Widget build(BuildContext context) {
    final isBullish = marketPrice.trend == "Bullish";

    return Card(
      color: const Color(0xFF1E2A38),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              marketPrice.symbol,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              marketPrice.price.toStringAsFixed(2),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              marketPrice.trend,
              style: TextStyle(
                color: isBullish ? Colors.greenAccent : Colors.redAccent,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
