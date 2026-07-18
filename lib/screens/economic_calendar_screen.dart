import 'package:flutter/material.dart';

import '../models/economic_event.dart';
import '../services/economic_service.dart';

class EconomicCalendarScreen extends StatefulWidget {
  const EconomicCalendarScreen({super.key});

  @override
  State<EconomicCalendarScreen> createState() =>
      _EconomicCalendarScreenState();
}

class _EconomicCalendarScreenState
    extends State<EconomicCalendarScreen> {

  final EconomicService service = EconomicService();

  List<EconomicEvent> events = [];

  bool loading = true;

  String? error;

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  Future<void> loadEvents() async {
    try {
      final result = await service.getEvents();

      setState(() {
        events = result;
        loading = false;
      });

    } catch (e) {

      setState(() {
        loading = false;
        error = e.toString();
      });

    }
  }

  Color impactColor(String impact) {

    switch (impact.toLowerCase()) {

      case "high":
        return Colors.red;

      case "medium":
        return Colors.orange;

      default:
        return Colors.green;

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Economic Calendar"),
      ),

      body: loading

          ? const Center(
              child: CircularProgressIndicator(),
            )

          : error != null

              ? Center(
                  child: Text(error!),
                )

              : ListView.builder(

                  itemCount: events.length,

                  itemBuilder: (context, index) {

                    final event = events[index];

                    return Card(

                      margin: const EdgeInsets.all(8),

                      child: ListTile(

                        leading: CircleAvatar(
                          backgroundColor:
                              impactColor(event.impact),
                        ),

                        title: Text(event.title),

                        subtitle: Text(
                          "${event.country}\n"
                          "Forecast : ${event.forecast}\n"
                          "Previous : ${event.previous}\n"
                          "Actual : ${event.actual}",
                        ),

                      ),

                    );

                  },

                ),

    );

  }
}
