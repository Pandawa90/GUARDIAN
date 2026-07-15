import '../models/market_price.dart';

class MarketService {
  Future<MarketPrice> getGoldPrice() async {
    return MarketPrice(
      symbol: "XAU/USD",
      price: 3378.25,
      trend: "Bullish",
      lastUpdate: DateTime.now(),
    );
  }
}
