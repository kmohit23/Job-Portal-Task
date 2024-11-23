enum UserRole {
  user,
  admin;

  factory UserRole.fromSting(String name) =>
      UserRole.values.firstWhere((e) => e.name == name);
}
