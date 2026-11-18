
import 'package:flutter/material.dart';

class AppImageButton extends StatefulWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double pressDepth;

  const AppImageButton({
    super.key,
    required this.imagePath,
    required this.onPressed,
    this.width,
    this.height,
    this.pressDepth = 5,
  });

  @override
  State<AppImageButton> createState() => _AppImageButtonState();
}

class _AppImageButtonState extends State<AppImageButton> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 80),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(
          0,
          _isPressed ? widget.pressDepth : 0,
          0,
        ),
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
