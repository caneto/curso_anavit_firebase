import 'package:chat_firebase/src/widgets/home_app_bar_widget.dart';
import 'package:chat_firebase/src/widgets/status_card_widgets.dart';
import 'package:flutter/material.dart';

class ContactsWidget extends StatelessWidget {
  const ContactsWidget({super.key});
  void logout() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: HomeAppBarWidget(
            userName: 'Carlos',
            unreadChatCount: 48,
            onLogoutTap: logout,
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 8, bottom: 16),
            child: Column(
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
            ),
          ),
        ),
      ],
    );
  }
}
