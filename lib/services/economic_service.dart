import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/economic_event.dart';

class EconomicService {
  Future<List<EconomicEvent>> getEvents() async {
    final url = Uri.parse(
      "https://api.twelvedata.com/economic_calendar?apikey=${Config.apiKey}",
    );

    final response = await http.get(url);

    print(response.body);

    if (response.statusCode != 200) {
      throw Exception("Gagal mengambil Economic Calendar");
    }

    final json = jsonDecode(response.body);

    if (json["data"] == null) {
      return [];
    }

    final List list = json["data"];

    return list.map((e) {
      return EconomicEvent(
        country: e["country"] ?? "",
        title: e["event"] ?? "",
        impact: e["importance"] ?? "",
        actual: e["actual"]?.toString() ?? "-",
        forecast: e["forecast"]?.toString() ?? "-",
        previous: e["previous"]?.toString() ?? "-",
        dateTime: DateTime.parse(e["date"]),
      );
    }).toList();
  }
}
