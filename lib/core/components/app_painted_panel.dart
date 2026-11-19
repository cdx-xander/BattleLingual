import 'package:battlelingual/core/constants/app_colors.dart';
import 'package:battlelingual/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class AppPaintedPanel extends StatelessWidget {
  final Widget? child;

  final double? width;
  final double? height;

  final double borderWidth;
  final double cornerLength;

  final EdgeInsetsGeometry? padding;

  const AppPaintedPanel({
    super.key,
    this.child,
    this.width,
    this.height,
    this.borderWidth = 3.0,
    this.cornerLength = 14.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _PanelPainter(
          borderWidth: borderWidth,
          cornerLength: cornerLength,
        ),
        child: Padding(
          padding: padding ?? ResponsiveUtils.paddingAll(context, 10),
          child: child,
        ),
      ),
    );
  }
}

class _PanelPainter extends CustomPainter {
  final double borderWidth;
  final double cornerLength;

  const _PanelPainter({
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
  bool shouldRepaint(covariant _PanelPainter oldDelegate) {
    return borderWidth != oldDelegate.borderWidth ||
        cornerLength != oldDelegate.cornerLength;
  }
}
