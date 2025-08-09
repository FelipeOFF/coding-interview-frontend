import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    required this.child,
    super.key,
    this.title,
    this.titleWidget,
    this.scrollable = false,
    this.draggable = false,
    this.maxHeight,
    this.initialHeight,
    this.backgroundColor,
    this.borderRadius = 20.0,
    this.showDragHandle = true,
    this.contentPadding = const EdgeInsets.all(16.0),
    this.isDismissible = true,
    this.showDivider = false,
  }) : assert(
         title != null || titleWidget != null,
         'Either title or titleWidget must be provided',
       );

  final String? title;

  final Widget? titleWidget;

  final Widget child;

  final bool scrollable;

  final bool draggable;

  final double? maxHeight;

  final double? initialHeight;

  final Color? backgroundColor;

  final double borderRadius;

  final bool showDragHandle;

  final EdgeInsets contentPadding;

  final bool isDismissible;

  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final dialogMaxHeight = maxHeight ?? screenHeight * 0.8;
    final dialogInitialHeight = initialHeight ?? dialogMaxHeight * 0.6;

    if (draggable) {
      return _buildDraggableDialog(
        context,
        screenHeight,
        dialogMaxHeight,
        dialogInitialHeight,
      );
    } else {
      return _buildStaticDialog(context, dialogMaxHeight);
    }
  }

  Widget _buildDraggableDialog(
    BuildContext context,
    double screenHeight,
    double maxHeight,
    double initialHeight,
  ) => DraggableScrollableSheet(
    initialChildSize: initialHeight / screenHeight,
    maxChildSize: maxHeight / screenHeight,
    builder: (context, scrollController) => DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).dialogTheme.backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          Expanded(child: _buildContent(context, scrollController)),
        ],
      ),
    ),
  );

  Widget _buildStaticDialog(
    BuildContext context,
    double maxHeight,
  ) => Container(
    constraints: BoxConstraints(maxHeight: maxHeight),
    decoration: BoxDecoration(
      color: backgroundColor ?? Theme.of(context).dialogTheme.backgroundColor,
      borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(context),
        Expanded(child: _buildContent(context, null)),
      ],
    ),
  );

  Widget _buildHeader(BuildContext context) => Column(
    children: [
      if (showDragHandle)
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 8),
          width: 36,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(2),
          ),
        ),

      if (title != null || titleWidget != null)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child:
              titleWidget ??
              Text(
                title!,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
        ),

      if (showDivider && (title != null || titleWidget != null))
        Divider(height: 1, thickness: 1, color: Colors.grey[300]),
    ],
  );

  Widget _buildContent(
    BuildContext context,
    ScrollController? scrollController,
  ) {
    final Widget content = Padding(padding: contentPadding, child: child);

    if (scrollable) {
      if (scrollController != null) {
        return SingleChildScrollView(
          controller: scrollController,
          child: content,
        );
      } else {
        return SingleChildScrollView(child: content);
      }
    }

    return content;
  }

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    Widget? titleWidget,
    bool scrollable = false,
    bool draggable = true,
    double? maxHeight,
    double? initialHeight,
    Color? backgroundColor,
    double borderRadius = 20.0,
    bool showDragHandle = true,
    EdgeInsets contentPadding = const EdgeInsets.all(16.0),
    bool isDismissible = true,
    bool useRootNavigator = true,
  }) => showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    isDismissible: isDismissible,
    useRootNavigator: useRootNavigator,
    isScrollControlled: true,
    enableDrag: isDismissible,
    // Add this line
    builder: (context) => GestureDetector(
      onTap: isDismissible ? () => Navigator.of(context).pop() : null,
      behavior: HitTestBehavior.opaque,
      // This ensures the gesture detector captures taps
      child: Container(
        color: Colors.transparent,
        // Transparent container to capture taps
        child: GestureDetector(
          onTap: () {},
          // Prevent taps on the dialog content from closing it
          child: AppDialog(
            title: title,
            titleWidget: titleWidget,
            scrollable: scrollable,
            draggable: draggable,
            maxHeight: maxHeight,
            initialHeight: initialHeight,
            backgroundColor: backgroundColor,
            borderRadius: borderRadius,
            showDragHandle: showDragHandle,
            contentPadding: contentPadding,
            isDismissible: isDismissible,
            child: child,
          ),
        ),
      ),
    ),
  );
}
