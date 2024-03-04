class UserModel {
  String uid;
  String name;
  String email;
  String password;
  bool termsAndConditions;
  String gender;
  String dateOfBirth;
  double weight;
  double height;
  String createdAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
    required this.termsAndConditions,
    required this.gender,
    required this.dateOfBirth,
    required this.createdAt,
    required this.weight,
    required this.height,
  });

  // Convert Firestore data to User object
  factory UserModel.fromdap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      termsAndConditions: map['termsAndConditions'] ?? false,
      gender: map['gender'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      weight: (map['weight'] ?? 0.0).toDouble(),
      height: (map['height'] ?? 0.0).toDouble(),
      createdAt: map['createdAt'] ?? '',
    );
  }

  // Convert User object to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'termsAndConditions': termsAndConditions,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'weight': weight,
      'height': height,
      'uid': uid,
      'createdAt': createdAt,
    };
  }

  UserModel updateFields(
    String? name,
    String? gender,
    String? dateOfBirth,
    double? weight,
    double? height,
  ) {
    return UserModel(
        uid: uid,
        name: name ?? this.name,
        email: email,
        password: password,
        termsAndConditions: termsAndConditions,
        gender: gender ?? this.gender,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        createdAt: createdAt,
        weight: weight ?? this.weight,
        height: height ?? this.height);
  }
}
