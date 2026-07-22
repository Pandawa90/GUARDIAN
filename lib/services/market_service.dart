import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/market_price.dart';

class MarketService {
  Future<MarketPrice> getLivePrice() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${Config.marketApiUrl}?symbol=XAUUSD&apikey=${Config.marketApiKey}',
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load market data');
      }

      final json = jsonDecode(response.body);

      final double price =
          (json['price'] as num?)?.toDouble() ?? 0.0;

      final String trend =
          json['trend']?.toString() ?? 'SIDEWAYS';

      return MarketPrice(
        symbol: 'XAUUSD',
        price: price,
        trend: trend,
        lastUpdate: DateTime.now(),
      );
    } catch (e) {
      throw Exception('MarketService Error: $e');
    }
  }
}
