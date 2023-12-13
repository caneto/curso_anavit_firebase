import 'package:flutter/material.dart';

class FilterCardWidget extends StatelessWidget {
  const FilterCardWidget({
    super.key,
    required this.label,
    required this.notificationAmount,
    required this.isSelected,
  });

  final bool isSelected;
  final String label;
  final int notificationAmount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.amber : Colors.white,
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
    );
  }
}
