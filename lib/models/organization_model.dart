import 'dart:convert';

class Organization {
  final String orgID;
  final String orgName;
  final String orgDesc;
  final String imageUrl;
  final String userID;
  final bool isPending;
  Organization({
    required this.orgID,
    required this.orgName,
    required this.orgDesc,
    required this.imageUrl,
    required this.userID,
    required this.isPending,
  });

  Organization copyWith({
    String? orgID,
    String? orgName,
    String? orgDesc,
    String? imageUrl,
    String? userID,
    bool? isPending,
  }) {
    return Organization(
      orgID: orgID ?? this.orgID,
      orgName: orgName ?? this.orgName,
      orgDesc: orgDesc ?? this.orgDesc,
      imageUrl: imageUrl ?? this.imageUrl,
      userID: userID ?? this.userID,
      isPending: isPending ?? this.isPending,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orgID': orgID,
      'orgName': orgName,
      'orgDesc': orgDesc,
      'imageUrl': imageUrl,
      'userID': userID,
      'isPending': isPending,
    };
  }

  factory Organization.fromMap(Map<String, dynamic> map) {
    return Organization(
      orgID: map['orgID'] as String,
      orgName: map['orgName'] as String,
      orgDesc: map['orgDesc'] as String,
      imageUrl: map['imageUrl'] as String,
      userID: map['userID'] as String,
      isPending: map['isPending'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Organization.fromJson(String source) =>
      Organization.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Organization(orgID: $orgID, orgName: $orgName, orgDesc: $orgDesc, imageUrl: $imageUrl, userID: $userID, isPending: $isPending)';
  }

  @override
  bool operator ==(covariant Organization other) {
    if (identical(this, other)) return true;

    return other.orgID == orgID &&
        other.orgName == orgName &&
        other.orgDesc == orgDesc &&
        other.imageUrl == imageUrl &&
        other.userID == userID &&
        other.isPending == isPending;
  }

  @override
  int get hashCode {
    return orgID.hashCode ^
        orgName.hashCode ^
        orgDesc.hashCode ^
        imageUrl.hashCode ^
        userID.hashCode ^
        isPending.hashCode;
  }
}
