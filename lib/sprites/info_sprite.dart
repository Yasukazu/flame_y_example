import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class InfoSprite extends TextComponent {
  InfoSprite({
    String? text,
    Color? color,
    double? fontSize,
  }) : super(
          text ?? "default",
          config: TextConfig(
            color: color ?? Colors.white,
            fontSize: fontSize ?? 32.0,
          ),
        ) {
    anchor = Anchor.center;
  }
}
