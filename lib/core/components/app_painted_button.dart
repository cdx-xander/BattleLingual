
import 'package:battlelingual/core/constants/app_colors.dart';
import 'package:flutter/material.dart'; 

class AppPaintedButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;

  final double? width;
  final double? height;

  final double outerStroke;
  final double innerStroke;
  final double cornerLength;

  final EdgeInsetsGeometry padding;

  const AppPaintedButton({
    super.key,
    this.child,
    this.onPressed,
    this.width,
    this.height,
    this.outerStroke = 3.0,
    this.innerStroke = 1.5,
    this.cornerLength = 14.0,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _ButtonPainter(
          outerStroke: outerStroke,
          innerStroke: innerStroke,
          cornerLength: cornerLength,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: padding,
              child: Center(
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonPainter extends CustomPainter {
  final double outerStroke;
  final double innerStroke;
  final double cornerLength;

  const _ButtonPainter({
    required this.outerStroke,
    required this.innerStroke,
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
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: AppColors.paintedBackgroundColor,
      ).createShader(rect);

    canvas.drawPath(path, bgPaint);

    // Cyan inner border
    final cyanPaint = Paint()
      ..color = AppColors.buttonCyan
      ..style = PaintingStyle.stroke
      ..strokeWidth = innerStroke;

    canvas.drawPath(path, cyanPaint);

    // Gold outer border
    final goldPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: AppColors.paintedBorderColor,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerStroke;

    canvas.drawPath(path, goldPaint);
  }

  @override
  bool shouldRepaint(covariant _ButtonPainter oldDelegate) {
    return outerStroke != oldDelegate.outerStroke ||
        innerStroke != oldDelegate.innerStroke ||
        cornerLength != oldDelegate.cornerLength;
  }
}
