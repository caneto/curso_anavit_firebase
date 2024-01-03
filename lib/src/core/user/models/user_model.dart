
import '../../shared/enums/user_status.dart';

class UserModel {
  const UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.status,
    required this.groupsPinned,
    required this.privatesPinned,
    required this.contacts,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ,
      email: map['email'] ,
      firstName: map['first_name'],
      lastName: map['last_name'],
      imageUrl: map['image_url'],
      status: UserStatus.fromCode(map['status']),
      groupsPinned: Set<String>.from(map['groups_pinned']),
      privatesPinned: Set<String>.from(map['privates_pinned']),
      contacts: Set<String>.from(map['contacts']),
    );
  }

  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final UserStatus status;
  final Set<String> groupsPinned;
  final Set<String> privatesPinned;
  final Set<String> contacts;

}
