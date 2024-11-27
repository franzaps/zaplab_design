import 'package:zapchat_design/src/utils/named.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:zapchat_design/src/theme/theme.dart';

/// Border Thicknesses
class AppBorderData extends Equatable {
  final double thin;
  final double medium;
  final double thick;

  const AppBorderData({
    required this.thin,
    required this.medium,
    required this.thick,
  });

  factory AppBorderData.fromThickness(LineThicknessData thicknessData) =>
      AppBorderData(
        thin: thicknessData.thin,
        medium: thicknessData.medium,
        thick: thicknessData.thick,
      );

  @override
  List<Object?> get props => [
        thin.named('thin'),
        medium.named('medium'),
        thick.named('thick'),
      ];
}

/// Painter for when the border needs to be a gradient
class GradientBorderPainter extends CustomPainter {
  final double borderWidth;
  final Gradient gradient;

  GradientBorderPainter({required this.borderWidth, required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = gradient.createShader(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2))
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    final radius = size.width / 2;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
