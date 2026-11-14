import 'package:flutter/material.dart';

class AppPanel extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double? outerStroke;
  final double? innerStroke;

  const AppPanel({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.outerStroke,
    this.innerStroke,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _ExactPanelPainter(
          outerStroke: outerStroke,
          innerStroke: innerStroke,
        ),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Center(child: child),
        ),
      ),
    );
  }
}

class _ExactPanelPainter extends CustomPainter {
  double?  outerStroke;
  double?  innerStroke;

  _ExactPanelPainter({
    this.outerStroke,
    this.innerStroke,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double cut = 16.0;
    final rect = Offset.zero & size;

    // 1️⃣ Octagonal Beveled Path
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

    // 2️⃣ Drop Shadow for Depth
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.65)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    canvas.drawPath(path.shift(const Offset(0, 6)), shadowPaint);

    // 3️⃣ Deep Royal Blue Gradient Interior
    final bgGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color(0xFF0A2A6C),
        const Color(0xFF03143F),
        const Color(0xFF01081E),
      ],
    );
    final bgPaint = Paint()
      ..shader = bgGradient.createShader(rect)
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, bgPaint);

    // 4️⃣ Inner Cyan Neon Accent Line
    final cyanPaint = Paint()
      ..color = const Color(0xFF00B4D8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawPath(path, cyanPaint);

    // 5️⃣ Outer Metallic Gold Border with Gradient Lighting
    final goldGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFFFFEA75), // Highlight
        const Color(0xFFFFB703), // Vibrant Gold
        const Color(0xFFB87315), // Metallic Shadow
        const Color(0xFFFFD166), // Mid Tone
      ],
      stops: const [0.0, 0.35, 0.75, 1.0],
    );

    final goldPaint = Paint()
      ..shader = goldGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerStroke ?? 4.0;
    canvas.drawPath(path, goldPaint);

    // 6️⃣ Corner Segment Dividers (Matching the asset's capped corner pieces)
    final jointStroke = Paint()
      ..color = const Color(0xFF8B5A00)
      ..strokeWidth = innerStroke ?? 2.0;

    canvas.drawLine(Offset(cut, 0), Offset(0, cut), jointStroke);
    canvas.drawLine(Offset(size.width - cut, 0), Offset(size.width, cut), jointStroke);
    canvas.drawLine(Offset(0, size.height - cut), Offset(cut, size.height), jointStroke);
    canvas.drawLine(Offset(size.width - cut, size.height), Offset(size.width, size.height - cut), jointStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}