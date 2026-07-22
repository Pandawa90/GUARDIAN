import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../models/economic_event.dart';

class EconomicService {
  Future<List<EconomicEvent>> getEvents() async {
    final url = Uri.parse(
      "${Config.calendarApiUrl}?apikey=${Config.calendarApiKey}",
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception(
        "Gagal mengambil Economic Calendar (Status ${response.statusCode})",
      );
    }

    final dynamic jsonData = jsonDecode(response.body);

    if (jsonData is! List) {
      throw Exception("Format data API tidak sesuai.");
    }

    return jsonData.map<EconomicEvent>((item) {
      return EconomicEvent(
        country: item["country"]?.toString() ?? "-",
        title: item["event"]?.toString() ?? "-",
        impact: item["impact"]?.toString() ?? "Low",
        actual: item["actual"]?.toString() ?? "-",
        forecast: item["estimate"]?.toString() ?? "-",
        previous: item["previous"]?.toString() ?? "-",
        dateTime: DateTime.tryParse(
              item["date"]?.toString() ?? "",
            ) ??
            DateTime.now(),
      );
    }).toList();
  }
}
