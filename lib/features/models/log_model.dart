class LoginModel {
  final String status;
  final String message;
  final Data? data;

  LoginModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      if (data != null) 'data': data!.toJson(),
    };
  }
}

class Data {
  final String token;
  final User user;

  Data({
    required this.token,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user.toJson(),
    };
  }
}

class User {
  final String id;
  final String name;
  final String roles;
  final int profits;
  final int benefits;
  final double platformFee;
  final String email;
  final String profileImage;
  final List<String> enrolledCourses;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.roles,
    required this.profits,
    required this.benefits,
    required this.platformFee,
    required this.email,
    required this.profileImage,
    required this.enrolledCourses,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      roles: json['roles'] ?? '',
      profits: json['profits'] ?? 0,
      benefits: json['Benefits'] ?? 0,
      platformFee: (json['platformFee'] ?? 0.0).toDouble(),
      email: json['email'] ?? '',
      profileImage: json['profileImage'] ?? '',
      enrolledCourses: List<String>.from(json['enrolledCourses'] ?? []),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'roles': roles,
      'profits': profits,
      'Benefits': benefits,
      'platformFee': platformFee,
      'email': email,
      'profileImage': profileImage,
      'enrolledCourses': enrolledCourses,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
