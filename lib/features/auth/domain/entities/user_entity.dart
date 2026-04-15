class UserEntity {
  final String uId;
  final String name;
  final String email;
  final String? userName;
  final String? imageUrl;

  UserEntity({
    required this.uId,
    required this.name,
    required this.email,
    this.userName,
    this.imageUrl,
  });
}
