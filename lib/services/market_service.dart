import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/market_price.dart';

class MarketService {
  Future<MarketPrice> getGoldPrice() async {
    final response = await http.get(Uri.parse(Config.baseUrl));

    final data = jsonDecode(response.body);

    if (data["price"] != null) {
      return MarketPrice(
        symbol: "XAU/USD",
        price: double.parse(data["price"]),
        trend: "LIVE",
        lastUpdate: DateTime.now(),
      );
    }

    throw Exception(data["message"] ?? "Unknown API Error");
  }
}
