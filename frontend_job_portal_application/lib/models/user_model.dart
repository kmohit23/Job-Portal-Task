import 'package:ar_job_portal/state/enums/user_role.dart';

class UserModel {
  UserModel({
    required this.name,
    required this.email,
    this.role = UserRole.user,
  });

  final String name;
  final String email;
  final UserRole role;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "role": role,
      };
}
