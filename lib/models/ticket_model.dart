import 'dart:convert';

class Ticket {
  final String id;
  final String eventId;
  final String ticketType;
  final double ticketPrice;
  final int ticketCount;

  Ticket({
    required this.id,
    required this.eventId,
    required this.ticketType,
    required this.ticketPrice,
    required this.ticketCount,
  });

  Ticket copyWith({
    String? id,
    String? eventId,
    String? ticketType,
    double? ticketPrice,
    int? ticketCount,
  }) {
    return Ticket(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      ticketType: ticketType ?? this.ticketType,
      ticketPrice: ticketPrice ?? this.ticketPrice,
      ticketCount: ticketCount ?? this.ticketCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'eventId': eventId,
      'ticketType': ticketType,
      'ticketPrice': ticketPrice,
      'ticketCount': ticketCount,
    };
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'] ?? '',
      eventId: map['eventId'] ?? '',
      ticketType: map['ticketType'] ?? '',
      ticketPrice: map['ticketPrice']?.toDouble() ?? 0.0,
      ticketCount: map['ticketCount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ticket.fromJson(String source) => Ticket.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ticket(id: $id, eventId: $eventId, ticketType: $ticketType, ticketPrice: $ticketPrice, ticketCount: $ticketCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ticket &&
        other.id == id &&
        other.eventId == eventId &&
        other.ticketType == ticketType &&
        other.ticketPrice == ticketPrice &&
        other.ticketCount == ticketCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        eventId.hashCode ^
        ticketType.hashCode ^
        ticketPrice.hashCode ^
        ticketCount.hashCode;
  }
}
