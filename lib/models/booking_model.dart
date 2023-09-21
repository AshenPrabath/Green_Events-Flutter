import 'dart:convert';

class Booking {
  final String userId;
  final String ticketID;
  final int quantity;
  final int createdAt;
  Booking({
    required this.userId,
    required this.ticketID,
    required this.quantity,
    required this.createdAt,
  });


  Booking copyWith({
    String? userId,
    String? ticketID,
    int? quantity,
    int? createdAt,
  }) {
    return Booking(
      userId: userId ?? this.userId,
      ticketID: ticketID ?? this.ticketID,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'ticketID': ticketID,
      'quantity': quantity,
      'createdAt': createdAt,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      userId: map['userId'] as String,
      ticketID: map['ticketID'] as String,
      quantity: map['quantity'] as int,
      createdAt: map['createdAt'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) => Booking.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Booking(userId: $userId, ticketID: $ticketID, quantity: $quantity, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Booking other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.ticketID == ticketID &&
      other.quantity == quantity &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      ticketID.hashCode ^
      quantity.hashCode ^
      createdAt.hashCode;
  }
}
