
import '../../shared/enums/user_status.dart';

class ContactModel {
  const ContactModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.status,
  });

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      imageUrl: map['image_url'],
      status: UserStatus.fromCode(map['status']),
    );
  }

  final String id;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final UserStatus status;
 
  String get fullName => '$firstName $lastName';
}
