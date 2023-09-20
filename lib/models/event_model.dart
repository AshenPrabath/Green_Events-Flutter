// event.dart

import 'dart:convert';

class Event {
  final String id;
  final String userId;
  final String title;
  final String image;
  final int time;
  final String venue;
  final String desc;
  final bool isFree;
  final String? link;
  Event({
    required this.id,
    required this.userId,
    required this.title,
    required this.image,
    required this.time,
    required this.venue,
    required this.desc,
    required this.isFree,
    this.link,
  });

  Event copyWith({
    String? id,
    String? userId,
    String? title,
    String? image,
    int? time,
    String? venue,
    String? desc,
    bool? isFree,
    String? link,
  }) {
    return Event(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      image: image ?? this.image,
      time: time ?? this.time,
      venue: venue ?? this.venue,
      desc: desc ?? this.desc,
      isFree: isFree ?? this.isFree,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'image': image,
      'time': time,
      'venue': venue,
      'desc': desc,
      'isFree': isFree,
      'link': link,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      time: map['time']?.toInt() ?? 0,
      venue: map['venue'] ?? '',
      desc: map['desc'] ?? '',
      isFree: map['isFree'] ?? false,
      link: map['link'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Event(id: $id, userId: $userId, title: $title, image: $image, time: $time, venue: $venue, desc: $desc, isFree: $isFree, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Event &&
        other.id == id &&
        other.userId == userId &&
        other.title == title &&
        other.image == image &&
        other.time == time &&
        other.venue == venue &&
        other.desc == desc &&
        other.isFree == isFree &&
        other.link == link;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        title.hashCode ^
        image.hashCode ^
        time.hashCode ^
        venue.hashCode ^
        desc.hashCode ^
        isFree.hashCode ^
        link.hashCode;
  }
}
