class AiSignal {
  final double currentPrice;
  final String signal;
  final String trend;
  final int confidence;
  final double support;
  final double resistance;
  final String recommendation;
  final String risk;

  const AiSignal({
    required this.currentPrice,
    required this.signal,
    required this.trend,
    required this.confidence,
    required this.support,
    required this.resistance,
    required this.recommendation,
    required this.risk,
  });

  factory AiSignal.fromJson(Map<String, dynamic> json) {
    return AiSignal(
      currentPrice: (json['currentPrice'] ?? 0).toDouble(),
      signal: json['signal'] ?? 'HOLD',
      trend: json['trend'] ?? 'SIDEWAYS',
      confidence: json['confidence'] ?? 0,
      support: (json['support'] ?? 0).toDouble(),
      resistance: (json['resistance'] ?? 0).toDouble(),
      recommendation: json['recommendation'] ?? '',
      risk: json['risk'] ?? 'LOW',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPrice': currentPrice,
      'signal': signal,
      'trend': trend,
      'confidence': confidence,
      'support': support,
      'resistance': resistance,
      'recommendation': recommendation,
      'risk': risk,
    };
  }

  AiSignal copyWith({
    double? currentPrice,
    String? signal,
    String? trend,
    int? confidence,
    double? support,
    double? resistance,
    String? recommendation,
    String? risk,
  }) {
    return AiSignal(
      currentPrice: currentPrice ?? this.currentPrice,
      signal: signal ?? this.signal,
      trend: trend ?? this.trend,
      confidence: confidence ?? this.confidence,
      support: support ?? this.support,
      resistance: resistance ?? this.resistance,
      recommendation: recommendation ?? this.recommendation,
      risk: risk ?? this.risk,
    );
  }
}
