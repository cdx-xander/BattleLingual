
import 'package:flutter/material.dart';

class AppButtonPanel extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final double outerStroke;
  final double innerStroke;

  const AppButtonPanel({
    super.key,
    required this.child,
    this.width,
    this.height = 65,
    this.onPressed,
    this.onLongPress,
    this.outerStroke = 4.0,
    this.innerStroke = 2.0,
  });

  @override
  State<AppButtonPanel> createState() => _AppButtonPanelState();
}

class _AppButtonPanelState extends State<AppButtonPanel> {
  bool isPressed = false;
  bool isLongPressed = false;

  double get scale {
    if (isLongPressed) return 0.97;
    if (isPressed) return 0.99;
    return 1.0;
  }

  void resetButton() {
    setState(() {
      isPressed = false;
      isLongPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isEnabled =
        widget.onPressed != null || widget.onLongPress != null;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTapDown: isEnabled
          ? (_) {
              setState(() {
                isPressed = true;
                isLongPressed = false;
              });
            }
          : null,

      onTapUp: isEnabled ? (_) => resetButton() : null,

      onTapCancel: resetButton,

      onTap: widget.onPressed,

      onLongPressStart: widget.onLongPress == null
          ? null
          : (_) {
              setState(() {
                isPressed = true;
                isLongPressed = true;
              });
            },

      onLongPressEnd: widget.onLongPress == null
          ? null
          : (_) => resetButton(),

      onLongPress: widget.onLongPress,

      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: CustomPaint(
            painter: _ExactButtonPainter(
              outerStroke: widget.outerStroke,
              innerStroke: widget.innerStroke,
            ),
            child: Center(
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

class _ExactButtonPainter extends CustomPainter {
  final double outerStroke;
  final double innerStroke;

  const _ExactButtonPainter({
    required this.outerStroke,
    required this.innerStroke,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double cut = 16.0;
    final rect = Offset.zero & size;

    final path = Path()
      ..moveTo(cut, 0)
      ..lineTo(size.width - cut, 0)
      ..lineTo(size.width, cut)
      ..lineTo(size.width, size.height - cut)
      ..lineTo(size.width - cut, size.height)
      ..lineTo(cut, size.height)
      ..lineTo(0, size.height - cut)
      ..lineTo(0, cut)
      ..close();

    // Background gradient
    final bgPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF0A2A6C),
          Color(0xFF03143F),
          Color(0xFF01081E),
        ],
      ).createShader(rect);

    canvas.drawPath(path, bgPaint);

    // Cyan inner border
    final cyanPaint = Paint()
      ..color = const Color(0xFF00B4D8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = innerStroke;

    canvas.drawPath(path, cyanPaint);

    // Gold outer border
    final goldPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFFEA75),
          Color(0xFFFFB703),
          Color(0xFFB87315),
          Color(0xFFFFD166),
        ],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerStroke;

    canvas.drawPath(path, goldPaint);
  }

  @override
  bool shouldRepaint(covariant _ExactButtonPainter oldDelegate) {
    return outerStroke != oldDelegate.outerStroke ||
        innerStroke != oldDelegate.innerStroke;
  }
}
