import 'dart:convert';

class Organization {
  final String orgId;
  final String orgName;
  final String orgDesc;
  final String imageUrl;
  final String userId;

  Organization({
    required this.orgId,
    required this.orgName,
    required this.orgDesc,
    required this.imageUrl,
    required this.userId,
  });

  Organization copyWith({
    String? orgId,
    String? orgName,
    String? orgDesc,
    String? imageUrl,
    String? userId,
  }) {
    return Organization(
      orgId: orgId ?? this.orgId,
      orgName: orgName ?? this.orgName,
      orgDesc: orgDesc ?? this.orgDesc,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orgId': orgId,
      'orgName': orgName,
      'orgDesc': orgDesc,
      'imageUrl': imageUrl,
      'userId': userId,
    };
  }

  factory Organization.fromMap(Map<String, dynamic> map) {
    return Organization(
      orgId: map['orgId'] as String,
      orgName: map['orgName'] as String,
      orgDesc: map['orgDesc'] as String,
      imageUrl: map['imageUrl'] as String,
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Organization.fromJson(String source) =>
      Organization.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Organization(orgId: $orgId, orgName: $orgName, orgDesc: $orgDesc, imageUrl: $imageUrl, userId: $userId)';
  }

  @override
  bool operator ==(covariant Organization other) {
    if (identical(this, other)) return true;
  
    return 
      other.orgId == orgId &&
      other.orgName == orgName &&
      other.orgDesc == orgDesc &&
      other.imageUrl == imageUrl &&
      other.userId == userId;
  }

  @override
  int get hashCode {
    return orgId.hashCode ^
      orgName.hashCode ^
      orgDesc.hashCode ^
      imageUrl.hashCode ^
      userId.hashCode;
  }
}
