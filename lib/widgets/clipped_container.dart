import 'package:flutter/material.dart';
import 'package:ui_travel/models/activity_model.dart';

class ClippedContainer extends StatelessWidget {
  final String? imageUrl;
  final Color? color;
  final double height;

  const ClippedContainer(
      {super.key, this.imageUrl, this.color, this.height = 400});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CustomClipper(),
      child: Container(
        height: height,
        color: (imageUrl == null) ? const Color(0xFFE8AA42) : null,
        decoration: (imageUrl != null)
            ? BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageUrl!), fit: BoxFit.cover))
            : null,
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.85,
        size.width * 0.3, size.height * 0.85);
    path.lineTo(size.width * 0.7, size.height * 0.85);

    path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.85, size.width * 1, size.height * 1);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
