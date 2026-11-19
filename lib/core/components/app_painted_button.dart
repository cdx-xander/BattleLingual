import 'package:battlelingual/core/constants/app_colors.dart';
import 'package:battlelingual/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class AppPaintedButton extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onPressed;

  final double? width;
  final double? height;

  final double borderWidth;
  final double cornerLength;

  final EdgeInsetsGeometry? padding;

  const AppPaintedButton({
    super.key,
    this.child,
    this.onPressed,
    this.width,
    this.height,
    this.borderWidth = 3.0,
    this.cornerLength = 14.0,
    this.padding,
  });

  @override
  State<AppPaintedButton> createState() => _AppPaintedButtonState();
}

class _AppPaintedButtonState extends State<AppPaintedButton> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    if (widget.onPressed == null) return;
    setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails details) {
    if (!_isPressed) return;
    setState(() => _isPressed = false);
    widget.onPressed?.call();
  }

  void _handleTapCancel() {
    if (!_isPressed) return;
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      behavior: HitTestBehavior.opaque,
      child: AnimatedScale(
        scale: _isPressed ? 0.94 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: CustomPaint(
            painter: _ButtonPainter(
              borderWidth: widget.borderWidth,
              cornerLength: widget.cornerLength,
            ),
            child: Padding(
              padding:
                  widget.padding ?? ResponsiveUtils.paddingAll(context, 8),
              child: Center(
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonPainter extends CustomPainter {
  final double borderWidth;
  final double cornerLength;

  const _ButtonPainter({
    required this.borderWidth,
    required this.cornerLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cut = cornerLength.clamp(
      0.0,
      size.shortestSide / 2,
    );

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

    // Shadow
    final shadowPaint = Paint()
      ..color = AppColors.buttonShadow
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        8,
      );

    canvas.drawPath(
      path.shift(const Offset(0, 5)),
      shadowPaint,
    );

    // Background gradient
    final bgPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: AppColors.paintedBackgroundColor,
      ).createShader(rect);

    canvas.drawPath(path, bgPaint);

    // Gold border
    final goldPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: AppColors.paintedBorderColor,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(path, goldPaint);
  }

  @override
  bool shouldRepaint(covariant _ButtonPainter oldDelegate) {
    return borderWidth != oldDelegate.borderWidth ||
        cornerLength != oldDelegate.cornerLength;
  }
}
