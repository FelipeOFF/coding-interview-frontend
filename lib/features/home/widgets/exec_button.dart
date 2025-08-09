import 'package:coding_interview_frontend/generated/l10n.dart';
import 'package:flutter/material.dart';

class ExecButton extends StatelessWidget {
  const ExecButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
      textStyle: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    ),
    child: Text(AppS.of(context).change),
  );
}
