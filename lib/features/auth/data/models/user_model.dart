import 'package:lapo_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uId, required super.name, required super.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['id'] ?? '',
      name: json['user_metadata']?['display_name'] ?? '',
      email: json['email'] ?? '',
    );
  }

}
