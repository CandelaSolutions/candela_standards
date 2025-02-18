import 'dart:ui' as ui;
import 'dart:io';
import 'package:candela_standards/candela_standard_app_profile.dart';
import 'package:flutter/material.dart';

Future<void> generateIcons(CandelaStandardAppProfile profile) async {
  const double size = 1024;
  final ui.Gradient gradient = ui.Gradient.linear(
    const Offset(0, 0),
    const Offset(0, size),
    profile.invertIconGradient
        ? [profile.primary, profile.secondary]
        : [profile.secondary, profile.primary],
  );

  List<Map<String, dynamic>> styles = [
    {
      'name': '${profile.text.toLowerCase()}1',
      'bg': gradient,
      'icon': Colors.white,
      'circle': false
    },
    {
      'name': '${profile.text.toLowerCase()}2',
      'bg': gradient,
      'icon': Colors.white,
      'circle': true
    },
    {
      'name': '${profile.text.toLowerCase()}3',
      'bg': Colors.black,
      'icon': gradient,
      'circle': false
    },
    {
      'name': '${profile.text.toLowerCase()}4',
      'bg': Colors.black,
      'icon': gradient,
      'circle': true
    },
    {
      'name': '${profile.text.toLowerCase()}WinInstaller',
      'bg': Colors.black,
      'icon': gradient,
      'circle': false,
      'overrideIcon': Icons.install_desktop,
    }
  ];

  for (var style in styles) {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // Draw background
    final Paint bgPaint = Paint();
    if (style['bg'] is ui.Gradient) {
      bgPaint.shader = style['bg'] as ui.Gradient;
    } else if (style['bg'] is Color) {
      bgPaint.color = style['bg'] as Color;
    }

    if (style['circle'] == true) {
      canvas.drawCircle(Offset(size / 2, size / 2), size / 2, bgPaint);
    } else {
      canvas.drawRect(Rect.fromLTWH(0, 0, size, size), bgPaint);
    }

    if (style.containsKey('overrideIcon')) {
      print(
          '${profile.text} ${style.containsKey('overrideIcon') ? style['overrideIcon'].codePoint : profile.icon.codePoint} ${style.containsKey('overrideIcon') ? style['overrideIcon'].fontFamily : profile.icon.fontFamily}');
    }

    // Draw icon
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(style.containsKey('overrideIcon')
            ? 984353
            : profile.icon.codePoint),
        style: TextStyle(
          package: style.containsKey('overrideIcon')
              ? style['overrideIcon'].fontPackage
              : profile.icon.fontPackage,
          fontSize:
              style.containsKey('overrideIcon') ? 1024.0 : profile.iconScale,
          fontFamily: style.containsKey('overrideIcon')
              ? style['overrideIcon'].fontFamily
              : profile.icon.fontFamily,
          foreground: (style['icon'] is ui.Gradient)
              ? (Paint()..shader = style['icon'] as ui.Gradient)
              : null,
          color: (style['icon'] is Color) ? style['icon'] as Color : null,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(
            (size - textPainter.width) / 2, (size - textPainter.height) / 2));

    // Convert and save
    final image =
        await recorder.endRecording().toImage(size.toInt(), size.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final directory = Directory('assets/icons');
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    final file = File('${directory.path}/${style['name']}.png');
    await file.writeAsBytes(byteData!.buffer.asUint8List());
    // print('Saved: ${file.path}');
  }
}
