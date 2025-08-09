import 'package:coding_interview_frontend/common/dialog/app_dialog.dart';
import 'package:coding_interview_frontend/generated/l10n.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    required this.title,
    required this.message,
    super.key,
    this.icon = Icons.error_outline,
    this.iconColor,
    this.buttonText,
    this.onButtonPressed,
    this.isDismissible = true,
  });

  final String title;

  final String message;

  final IconData? icon;

  final Color? iconColor;

  final String? buttonText;

  final VoidCallback? onButtonPressed;

  final bool isDismissible;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (icon != null) ...[
        Icon(
          icon,
          size: 48,
          color: iconColor ?? Theme.of(context).colorScheme.error,
        ),
        const SizedBox(height: 16),
      ],

      Text(
        message,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Theme.of(
            context,
          ).textTheme.bodyLarge?.color?.withValues(alpha: 0.8),
        ),
        textAlign: TextAlign.center,
      ),

      const SizedBox(height: 24),

      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onButtonPressed ?? () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            buttonText ?? AppS.of(context).close,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ],
  );

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String message,
    IconData? icon = Icons.error_outline,
    Color? iconColor,
    String? buttonText,
    VoidCallback? onButtonPressed,
    bool isDismissible = true,
    bool useRootNavigator = true,
  }) => AppDialog.show<T>(
    context: context,
    title: title,
    draggable: false,
    showDragHandle: false,
    isDismissible: isDismissible,
    useRootNavigator: useRootNavigator,
    maxHeight: MediaQuery.of(context).size.height * 0.5,
    backgroundColor: Colors.white,
    child: ErrorDialog(
      title: title,
      message: message,
      icon: icon,
      iconColor: iconColor,
      buttonText: buttonText,
      onButtonPressed: onButtonPressed,
      isDismissible: isDismissible,
    ),
  );
}
