import 'package:flutter/material.dart';

class KeyValueEntryWidget extends StatelessWidget {
  const KeyValueEntryWidget({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text(title, style: Theme.of(context).textTheme.bodyMedium),
      const Spacer(),
      Text(
        value,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    ],
  );
}
