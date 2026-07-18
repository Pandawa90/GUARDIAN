class EconomicEvent {
  final String country;
  final String title;
  final String impact;
  final String actual;
  final String forecast;
  final String previous;
  final DateTime dateTime;

  EconomicEvent({
    required this.country,
    required this.title,
    required this.impact,
    required this.actual,
    required this.forecast,
    required this.previous,
    required this.dateTime,
  });
}
