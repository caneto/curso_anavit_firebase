import 'package:flutter/material.dart';

import '../../../../core/shared/themes/app_colors_extension.dart';

class FilterCardWidget extends StatelessWidget {
  const FilterCardWidget({
    super.key,
    required this.label,
    required this.notificationAmount,
    required this.isSelected,
    required this.onTap,
  });

  final bool isSelected;
  final String label;
  final int notificationAmount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorsExtension>();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? colors?.secundary : theme.colorScheme.onPrimary,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text(
                label,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: isSelected ? Colors.black : Colors.grey.shade800,
                ),
              ),
              if (notificationAmount > 0) ...{
                const SizedBox(width: 8),
                Badge.count(
                  count: notificationAmount,
                  textColor: isSelected ? Colors.white : Colors.black,
                  backgroundColor: isSelected ? Colors.black : Colors.white,
                )
              },
            ],
          ),
        ),
      ),
    );
  }
}
