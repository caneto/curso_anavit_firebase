import 'package:flutter/material.dart';

import 'status_card_widgets.dart';

class ContactsWidget extends StatelessWidget {
  const ContactsWidget({super.key});
 

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
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, index) {
              return StatusCardWidgets(
                  isOnline: index.isEven,
                  userImage:
                      'https://avatars.githubusercontent.com/u/2157300?v=4',
                  userName: 'Carlos');
            },
          ),
        ),
      ],
    );
  }
}
