import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/contacts/blocs/contacts_bloc.dart';
import '../../../../core/contacts/blocs/state/contacts_state.dart';
import '../widgets/status_card_widgets.dart';

class ContactsComponent extends StatelessWidget {
  const ContactsComponent({super.key, required this.contactsBloc});

  final ContactsBloc contactsBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: theme.primaryTextTheme.bodyMedium,
            children: [
              TextSpan(
                  text: 'Contact ',
                  style: theme.primaryTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
              const TextSpan(text: 'List'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        BlocBuilder(
          bloc: contactsBloc,
          builder: (_, ContactsState state) {
            switch (state) {
              case LoadingContactsState():
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              case DataContactsState():
                return Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.contacts.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (_, index) {
                      final contact = state.contacts.elementAt(index);

                      return StatusCardWidgets(
                          isOnline: contact.status.isOnline,
                          userImage: contact.imageUrl,
                          userName: contact.firstName);
                    },
                  ),
                );
            }
          },
        )
      ],
    );
  }
}
