import 'package:chat_firebase/src/widgets/contacts_widget.dart';
import 'package:chat_firebase/src/widgets/filter_bar_widget.dart';
import 'package:chat_firebase/src/widgets/filter_card_widget.dart';
import 'package:chat_firebase/src/widgets/home_app_bar_widget.dart';
import 'package:chat_firebase/src/widgets/user_image_widget.dart';
import 'package:flutter/material.dart';

void logout() {}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: HomeAppBarWidget(
                userName: 'Carlos',
                unreadChatCount: 48,
                onLogoutTap: logout,
              ),
            ),
            const Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 16),
                child: ContactsWidget(),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const FilterBarWidget(),
                    Column(
                      children: [
                        const Text('Pinned Message(2)'),
                        Row(
                          children: [
                            UserImageWidget(
                              radius: size.width * 0.1,
                              imageUrl:
                                  'https://avatars.githubusercontent.com/u/2157300?v=4',
                              isOnline: true,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Carlos Alberto',
                                  style: theme.textTheme.titleLarge,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Contact',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text('11:00 Am'),
                                const SizedBox(height: 8),
                                Icon(
                                  Icons.check,
                                  color: theme.primaryColor,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
