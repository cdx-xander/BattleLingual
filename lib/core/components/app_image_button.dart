import 'package:flutter/material.dart';

class AppImageButton extends StatefulWidget {
  final String imagePath;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double pressScale;

  const AppImageButton({
    super.key,
    required this.imagePath,
    required this.onPressed,
    this.width,
    this.height,
    this.pressScale = 0.94,
  });

  @override
  State<AppImageButton> createState() => _AppImageButtonState();
}

class _AppImageButtonState extends State<AppImageButton> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    if (widget.onPressed == null) return;
    setState(() => _isPressed = true);
  }

  void _onTapUp(TapUpDetails details) {
    if (!_isPressed) return;
    setState(() => _isPressed = false);
    widget.onPressed?.call();
  }

  void _onTapCancel() {
    if (!_isPressed) return;
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      behavior: HitTestBehavior.opaque,
      child: AnimatedScale(
        scale: _isPressed ? widget.pressScale : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: Image.asset(
          widget.imagePath,
          width: widget.width,
          height: widget.height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
