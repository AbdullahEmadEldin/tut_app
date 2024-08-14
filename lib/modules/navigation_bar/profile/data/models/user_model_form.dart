// ignore_for_file: public_member_api_docs, sort_constructors_first

/// used to patch user data
class UserModelForm {
  final String profilePic;
  final String phone;

  final String name;

  UserModelForm({
    required this.profilePic,
    required this.phone,
    required this.name,
  });

  UserModelForm copyWith({
    String? profilePic,
    String? phone,
    String? name,
  }) {
    return UserModelForm(
      profilePic: profilePic ?? this.profilePic,
      phone: phone ?? this.phone,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'location':
          '{"name":"Egypt","address":"meet halfa","coordinates":[1214451511,12541845]}', // r
      'profilePic': profilePic,
    };
  }

  factory UserModelForm.fromMap(Map<String, dynamic> map) {
    return UserModelForm(
      profilePic: map['profilePic'] as String,
      phone: map['phone'] as String,
      name: map['name'] as String,
    );
  }
}
