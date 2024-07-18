import 'dart:convert';

class Favorites {
  final String id;
  final String userID;
  final String eventID;
  Favorites({
    required this.id,
    required this.userID,
    required this.eventID,
  });

  Favorites copyWith({
    String? id,
    String? userID,
    String? eventID,
  }) {
    return Favorites(
      id: id ?? this.id,
      userID: userID ?? this.userID,
      eventID: eventID ?? this.eventID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userID': userID,
      'eventID': eventID,
    };
  }

  factory Favorites.fromMap(Map<String, dynamic> map) {
    return Favorites(
      id: map['id'] ?? '',
      userID: map['userID'] ?? '',
      eventID: map['eventID'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorites.fromJson(String source) =>
      Favorites.fromMap(json.decode(source));

  @override
  String toString() => 'Favorites(id: $id, userID: $userID, eventID: $eventID)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Favorites &&
        other.id == id &&
        other.userID == userID &&
        other.eventID == eventID;
  }

  @override
  int get hashCode => id.hashCode ^ userID.hashCode ^ eventID.hashCode;
}
