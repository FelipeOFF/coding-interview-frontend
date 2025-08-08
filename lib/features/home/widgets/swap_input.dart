import 'dart:math' as math;

import 'package:coding_interview_frontend/util/double_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SwapInput extends StatefulWidget {
  const SwapInput({
    required this.leftTitle,
    required this.leftIcon,
    required this.leftCoin,
    required this.rightTitle,
    required this.rightIcon,
    required this.rightCoin,
    super.key,
    this.onSwap,
  });

  final String leftTitle;
  final Widget leftIcon;
  final String leftCoin;
  final String rightTitle;
  final Widget rightIcon;
  final String rightCoin;
  final void Function(bool swap)? onSwap;

  @override
  State<SwapInput> createState() => _SwapInputState();
}

class _SwapInputState extends State<SwapInput>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ac;
  late final Animation<double> _rotation;
  late final Animation<double> _slide;
  bool _swapped = false;

  @override
  void initState() {
    super.initState();
    _ac = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    final curve = CurvedAnimation(parent: _ac, curve: Curves.easeInOutCubic);
    _rotation = Tween<double>(begin: 0, end: 1).animate(curve);
    _slide = Tween<double>(begin: 0, end: 1).animate(curve);
  }

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  Future<void> _toggle() async {
    await HapticFeedback.selectionClick();
    if (_swapped) {
      await _ac.reverse();
    } else {
      await _ac.forward();
    }
    setState(() {
      _swapped = !_swapped;
      widget.onSwap?.call(_swapped);
    });
  }

  @override
  Widget build(BuildContext context) {
    const yellow = Color(0xFFF6A800);
    const stroke = 3.0;
    const radius = 40.0;

    return LayoutBuilder(
      builder: (context, c) {
        const totalH = 48.0;
        const circleSize = 82.0;
        const innerHPad = 24.0;

        return SizedBox(
          height: totalH,
          width: double.infinity,
          child: AnimatedBuilder(
            animation: _ac,
            builder: (context, _) => CustomPaint(
              painter: _CapsuleBorderWithLabelsPainter(
                strokeColor: yellow,
                strokeWidth: stroke,
                radius: radius,
                leftText: widget.leftTitle,
                rightText: widget.rightTitle,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  fontSize: 12,
                  color: Colors.black87,
                ),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                labelBgColor: Colors.white,
                topPaddingForBorder: 4,
                bottomPaddingForBorder: 4,
                cutHeight: 14,
                cutWidthExtra: 12,
              ),
              child: _RowContent(
                circleSize: circleSize,
                innerHPad: innerHPad,
                rotation: _rotation.value,
                slideT: _slide.value,
                onSwap: _toggle,
                yellow: yellow,
                leftIcon: widget.leftIcon,
                leftText: widget.leftCoin,
                rightIcon: widget.rightIcon,
                rightText: widget.rightCoin,
                centerIcon: const Icon(
                  Icons.swap_horiz,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _RowContent extends StatelessWidget {
  const _RowContent({
    required this.circleSize,
    required this.innerHPad,
    required this.rotation,
    required this.slideT,
    required this.onSwap,
    required this.yellow,
    required this.leftIcon,
    required this.rightIcon,
    required this.leftText,
    required this.rightText,
    required this.centerIcon,
  });

  final double circleSize;
  final double innerHPad;
  final double rotation;
  final double slideT;
  final VoidCallback onSwap;
  final Color yellow;
  final Widget leftIcon;
  final String leftText;
  final Widget rightIcon;
  final String rightText;
  final Widget centerIcon;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, c) {
      final w = c.maxWidth;
      final gapForCircle = circleSize / 2 + 16; // keep space center
      final sideWidth = (w - gapForCircle - innerHPad * 2) / 2;

      // slide distance: from original side to opposite side centers
      final slideDist = (sideWidth + (gapForCircle - 16) / 2) + (sideWidth / 2);

      // Left tile transforms
      final leftX = slideT.lerpDouble(0, slideDist);

      // Right tile transforms (negative direction)
      final rightX = slideT.lerpDouble(0, -slideDist);

      // check if the count is ok
      final result = w - (gapForCircle + sideWidth * 2 + innerHPad * 2);
      if (result == 0) {
        print('Everything is ok');
      }

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: innerHPad),
        child: Row(
          children: [
            // Left selector
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: SizedBox(
                width: sideWidth,
                child: Transform.translate(
                  offset: Offset(leftX, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: double.infinity,
                      child: _SelectorTile(
                        leading: leftIcon,
                        title: leftText,
                        alignRight: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Center circle
            SizedBox(
              width: gapForCircle,
              child: Center(
                child: GestureDetector(
                  onTap: onSwap,
                  child: Container(
                    width: circleSize,
                    height: circleSize,
                    decoration: BoxDecoration(
                      color: yellow,
                      shape: BoxShape.circle,
                    ),
                    child: Transform.rotate(
                      angle: rotation * math.pi, // 0..180°
                      child: Center(child: centerIcon),
                    ),
                  ),
                ),
              ),
            ),
            // Right selector
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: SizedBox(
                width: sideWidth,
                child: Transform.translate(
                  offset: Offset(rightX, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: double.infinity,
                      child: _SelectorTile(
                        leading: rightIcon,
                        title: rightText,
                        alignRight: true,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class _SelectorTile extends StatelessWidget {
  const _SelectorTile({
    required this.leading,
    required this.title,
    required this.alignRight,
  });

  final Widget leading;
  final String title;
  final bool alignRight;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: alignRight
        ? MainAxisAlignment.end
        : MainAxisAlignment.start,
    children: [
      SizedBox(width: 22, height: 22, child: leading),
      const SizedBox(width: 4),
      Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
      const Icon(Icons.keyboard_arrow_down, size: 20, color: Colors.black),
    ],
  );
}

// Painter that draws border + labels with cuts
class _CapsuleBorderWithLabelsPainter extends CustomPainter {
  const _CapsuleBorderWithLabelsPainter({
    required this.strokeColor,
    required this.strokeWidth,
    required this.radius,
    required this.leftText,
    required this.rightText,
    required this.textStyle,
    required this.labelPadding,
    required this.labelBgColor,
    required this.topPaddingForBorder,
    required this.bottomPaddingForBorder,
    required this.cutHeight,
    required this.cutWidthExtra,
  });

  final Color strokeColor;
  final double strokeWidth;
  final double radius;

  final String leftText;
  final String rightText;
  final TextStyle textStyle;
  final EdgeInsets labelPadding;
  final Color labelBgColor;

  final double topPaddingForBorder;
  final double bottomPaddingForBorder;
  final double cutHeight;
  final double cutWidthExtra;

  @override
  void paint(Canvas canvas, Size size) {
    final r = radius.clamp(0.0, size.shortestSide / 2);
    final rect = RRect.fromLTRBR(
      strokeWidth / 2,
      strokeWidth / 2 + topPaddingForBorder,
      size.width - strokeWidth / 2,
      size.height - strokeWidth / 2 - bottomPaddingForBorder,
      Radius.circular(r),
    );

    // Text painters to measure chips
    final leftTp = _tp(leftText, textStyle);
    final rightTp = _tp(rightText, textStyle);

    final leftChip = _chipRect(rect, leftTp.size, labelPadding, isLeft: true);
    final rightChip = _chipRect(
      rect,
      rightTp.size,
      labelPadding,
      isLeft: false,
    );

    // Stroke
    final stroke = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true;
    canvas.drawRRect(rect, stroke);

    // Chip backgrounds
    final chipBgPaint = Paint()
      ..color = labelBgColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    canvas
      ..drawRRect(
        RRect.fromRectAndRadius(leftChip, const Radius.circular(6)),
        chipBgPaint,
      )
      ..drawRRect(
        RRect.fromRectAndRadius(rightChip, const Radius.circular(6)),
        chipBgPaint,
      );

    // Texts
    leftTp.paint(
      canvas,
      Offset(
        leftChip.left + labelPadding.left,
        leftChip.top + labelPadding.top,
      ),
    );
    rightTp.paint(
      canvas,
      Offset(
        rightChip.left + labelPadding.left,
        rightChip.top + labelPadding.top,
      ),
    );
  }

  static Rect _chipRect(
    RRect rect,
    Size textSize,
    EdgeInsets pad, {
    required bool isLeft,
  }) {
    const sideMargin = 30.0;
    final chipSize = Size(
      textSize.width + pad.horizontal,
      textSize.height + pad.vertical,
    );
    final top =
        rect.top -
        12 +
        (24 - chipSize.height) /
            2; // aligns with topPaddingForBorder=24 default
    final left = isLeft
        ? rect.left + sideMargin
        : rect.right - sideMargin - chipSize.width;
    return Rect.fromLTWH(left, top, chipSize.width, chipSize.height);
  }

  static TextPainter _tp(String text, TextStyle style) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
    return tp;
  }

  @override
  bool shouldRepaint(covariant _CapsuleBorderWithLabelsPainter old) =>
      strokeColor != old.strokeColor ||
      strokeWidth != old.strokeWidth ||
      radius != old.radius ||
      leftText != old.leftText ||
      rightText != old.rightText ||
      textStyle != old.textStyle ||
      labelPadding != old.labelPadding ||
      labelBgColor != old.labelBgColor ||
      topPaddingForBorder != old.topPaddingForBorder ||
      cutHeight != old.cutHeight ||
      cutWidthExtra != old.cutWidthExtra;
}
