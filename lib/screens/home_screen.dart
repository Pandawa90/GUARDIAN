import 'package:flutter/material.dart';

import '../models/economic_event.dart';
import '../models/market_price.dart';

import '../services/economic_service.dart';
import '../services/market_service.dart';

import '../widgets/price_card.dart';

import 'economic_calendar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MarketService marketService = MarketService();
  final EconomicService economicService = EconomicService();

  MarketPrice? marketPrice;
  List<EconomicEvent> events = [];

  bool loading = true;
  bool loadingEvents = false;

  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadMarket();
  }

  Future<void> loadMarket() async {
    setState(() {
      loading = true;
      errorMessage = null;
    });

    try {
      final result = await marketService.getGoldPrice();

      setState(() {
        marketPrice = result;
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101820),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101820),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "GUARDIAN",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Market Intelligence",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 30),

            if (loading)
              const CircularProgressIndicator()
            else if (marketPrice != null)
              PriceCard(
                marketPrice: marketPrice!,
              )
            else
              Text(
                errorMessage ?? "Unknown Error",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: loadMarket,
              icon: const Icon(Icons.refresh),
              label: const Text("Refresh Harga"),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const EconomicCalendarScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.event),
              label: const Text("Economic Calendar"),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.smart_toy),
              label: const Text("AI Prediction"),
            ),
          ],
        ),
      ),
    );
  }
}
