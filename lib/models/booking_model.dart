import 'dart:convert';

class Booking {
  final String userId;
  final String ticketID;
  final int createdAt;

  Booking(
    this.userId,
    this.ticketID,
    this.createdAt,
  );

  Booking copyWith({
    String? userId,
    String? ticketID,
    int? createdAt,
  }) {
    return Booking(
      userId ?? this.userId,
      ticketID ?? this.ticketID,
      createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'ticketID': ticketID,
      'createdAt': createdAt,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      map['userId'] ?? '',
      map['ticketID'] ?? '',
      map['createdAt']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source));

  @override
  String toString() =>
      'Booking(userId: $userId, ticketID: $ticketID, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Booking &&
        other.userId == userId &&
        other.ticketID == ticketID &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => userId.hashCode ^ ticketID.hashCode ^ createdAt.hashCode;
};