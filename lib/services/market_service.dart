import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/market_price.dart';

class MarketService {
  Future<MarketPrice> getGoldPrice() async {
    final url = Uri.parse(Config.baseUrl);

    final response = await http.get(url);

    print("STATUS CODE : ${response.statusCode}");
    print("BODY : ${response.body}");

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 && data["price"] != null) {
      return MarketPrice(
        symbol: "XAU/USD",
        price: double.parse(data["price"].toString()),
        trend: "LIVE",
        lastUpdate: DateTime.now(),
      );
    }

    throw Exception(response.body);
  }
}
