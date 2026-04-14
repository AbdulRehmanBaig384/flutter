class User {
  final String name;
  final String email;
  final String studentId;
  final String department;
  final String role;

  const User({
    required this.name,
    required this.email,
    required this.studentId,
    required this.department,
    required this.role,
  });

  String get initials {
    final parts = name.split(' ');
    return parts.map((part) => part.isNotEmpty ? part[0] : '').take(2).join();
  }
}
