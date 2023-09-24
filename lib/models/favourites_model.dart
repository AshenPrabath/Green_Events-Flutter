import 'dart:convert';

class Favourites {
  final String UserID;
  final String EventID;
  Favourites({
    required this.UserID,
    required this.EventID,
  });

  Favourites copyWith({
    String? UserID,
    String? EventID,
  }) {
    return Favourites(
      UserID: UserID ?? this.UserID,
      EventID: EventID ?? this.EventID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'UserID': UserID,
      'EventID': EventID,
    };
  }

  factory Favourites.fromMap(Map<String, dynamic> map) {
    return Favourites(
      UserID: map['UserID'] ?? '',
      EventID: map['EventID'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Favourites.fromJson(String source) =>
      Favourites.fromMap(json.decode(source));

  @override
  String toString() => 'Favourites(UserID: $UserID, EventID: $EventID)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Favourites &&
        other.UserID == UserID &&
        other.EventID == EventID;
  }

  @override
  int get hashCode => UserID.hashCode ^ EventID.hashCode;
}
