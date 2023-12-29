import '../../../core/user/blocs/states/user_state.dart';

class ContactModel {
  const ContactModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.status,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final UserState status;
}
