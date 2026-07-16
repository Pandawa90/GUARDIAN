import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/market_price.dart';

class MarketService {
  Future<MarketPrice> getGoldPrice() async {
    final response = await http.get(Uri.parse(Config.baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final double price =
          double.tryParse(data["price"].toString()) ?? 0.0;

      return MarketPrice(
        symbol: "XAU/USD",
        price: price,
        trend: "Live",
        lastUpdate: DateTime.now(),
      );
    }

    throw Exception("Gagal mengambil data dari Twelve Data");
  }
}
