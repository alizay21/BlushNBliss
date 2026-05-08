class UserModel {
  final String uid;
  final String email;
  final String name;
  final String phone;
  final String? profileImageUrl;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.phone,
    this.profileImageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String docId) {
    return UserModel(
      uid: docId,
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      profileImageUrl: map['profileImageUrl'],
    );
  }
}

class ServiceModel {
  final String id;
  final String name;
  final String description;
  final String iconAsset;
  final double startingPrice;
  final int durationMinutes;
  final List<String> inclusions;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.iconAsset,
    required this.startingPrice,
    required this.durationMinutes,
    required this.inclusions,
  });
}
