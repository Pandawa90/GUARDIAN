class EconomicEvent {
  final String title;
  final String country;
  final String impact;
  final DateTime dateTime;
  final String forecast;
  final String previous;
  final String? actual;

  const EconomicEvent({
    required this.title,
    required this.country,
    required this.impact,
    required this.dateTime,
    required this.forecast,
    required this.previous,
    this.actual,
  });

  factory EconomicEvent.fromJson(Map<String, dynamic> json) {
    return EconomicEvent(
      title: json['title'] ?? '',
      country: json['country'] ?? '',
      impact: json['impact'] ?? 'Low',
      dateTime: DateTime.tryParse(json['dateTime'] ?? '') ?? DateTime.now(),
      forecast: json['forecast']?.toString() ?? '',
      previous: json['previous']?.toString() ?? '',
      actual: json['actual']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'country': country,
      'impact': impact,
      'dateTime': dateTime.toIso8601String(),
      'forecast': forecast,
      'previous': previous,
      'actual': actual,
    };
  }

  EconomicEvent copyWith({
    String? title,
    String? country,
    String? impact,
    DateTime? dateTime,
    String? forecast,
    String? previous,
    String? actual,
  }) {
    return EconomicEvent(
      title: title ?? this.title,
      country: country ?? this.country,
      impact: impact ?? this.impact,
      dateTime: dateTime ?? this.dateTime,
      forecast: forecast ?? this.forecast,
      previous: previous ?? this.previous,
      actual: actual ?? this.actual,
    );
  }
}
