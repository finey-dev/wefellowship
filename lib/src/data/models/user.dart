import 'package:flutter/foundation.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String dob;
  final String createdAt;
  final bool isVerified;
  final String fcmToken;
  final String relationshipstatus;
  final String bio;
  final String avatar;
  final String country;
  final String countrycode;

  UserModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.phone,
      required this.gender,
      required this.dob,
      required this.createdAt,
      required this.isVerified,
      required this.fcmToken,
      required this.relationshipstatus,
      required this.bio,
      required this.avatar,
      required this.country,
      required this.countrycode});

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? gender,
    String? dob,
    String? createdAt,
    bool? isVerified,
    String? fcmToken,
    String? relationshipstatus,
    String? bio,
    String? avatar,
    String? country,
    String? countrycode,
  }) {
    return UserModel(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        gender: gender ?? this.gender,
        dob: dob ?? this.dob,
        createdAt: createdAt ?? this.createdAt,
        isVerified: isVerified ?? this.isVerified,
        fcmToken: fcmToken ?? this.fcmToken,
        relationshipstatus: relationshipstatus ?? this.relationshipstatus,
        bio: bio ?? this.bio,
        avatar: avatar ?? this.avatar,
        country: country ?? this.country,
        countrycode: countrycode ?? this.countrycode);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'dob': dob,
      'createdAt': createdAt,
      'isVerified': isVerified,
      'fcmToken': fcmToken,
      'relationshipstatus': relationshipstatus,
      'bio': bio,
      'avatar': avatar,
      'country': country,
      'countrycode': countrycode,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      gender: map['gender'] ?? '',
      dob: map['dob'] ?? '',
      createdAt: map['createdAt'] ?? '',
      isVerified: map['isVerified'] ?? false,
      fcmToken: map['fcmToken'] ?? '',
      relationshipstatus: map['relationshipstatus'] ?? '',
      bio: map['bio'] ?? '',
      avatar: map['avatar'] ?? '',
      country: map['country'] ?? '',
      countrycode: map['countrycode'] ?? '',
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, phone: $phone, gender: $gender, dob: $dob, createdAt: $createdAt, isVerified: $isVerified, fcmToken: $fcmToken, relationshipstatus: $relationshipstatus, bio: $bio, avatar: $avatar, country: $country, countrycode: $countrycode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel &&
        other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.gender == gender &&
        other.dob == dob &&
        other.createdAt == createdAt &&
        other.isVerified == isVerified &&
        other.fcmToken == fcmToken &&
        other.relationshipstatus == relationshipstatus &&
        other.bio == bio &&
        other.avatar == avatar &&
        other.country == country &&
        other.countrycode == countrycode;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        gender.hashCode ^
        dob.hashCode ^
        createdAt.hashCode ^
        isVerified.hashCode ^
        fcmToken.hashCode ^
        relationshipstatus.hashCode ^
        bio.hashCode ^
        avatar.hashCode ^
        country.hashCode ^
        countrycode.hashCode;
  }
}
