import 'package:chat_firebase/src/pages/home/widgets/filter_card_widget.dart';
import 'package:chat_firebase/src/pages/home/widgets/search_filter_widget.dart';
import 'package:flutter/material.dart';

class FilterBarWidget extends StatelessWidget {
  const FilterBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchFilterWidget(
      onSearch: (String searchText) {  },
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterCardWidget(
            label: 'Privated Message',
            notificationAmount: 32,
            isSelected: true,
          ),
          SizedBox(height: 12),
          FilterCardWidget(
            label: 'Gruop',
            notificationAmount: 3,
            isSelected: false,
          ),
        ],
      ),
    );
  }
}
