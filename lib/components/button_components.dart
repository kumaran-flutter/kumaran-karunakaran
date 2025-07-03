import 'package:flutter/material.dart';
import 'package:kumaran_k_portfolio/styles/styles.dart';

class ButtonComponents {
  static Widget filledButton({
    required VoidCallback onPressed,
    required String label,
    Size? size, // Optional size param
  }) {
    return SizedBox(
      width: size?.width,
      height: size?.height,
      child: FilledButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
          elevation: WidgetStateProperty.all(4),
          textStyle: WidgetStateProperty.all(
            Paragraph03(color: Colors.white).regular,
          ),
          backgroundColor: WidgetStateProperty.all(Primary.primary400),
          foregroundColor: WidgetStateProperty.all(Colors.white),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  static Widget elevatedButton({
    required VoidCallback onPressed,
    required String label,
    Size? size, // Optional size param
  }) {
    return SizedBox(
      width: size?.width,
      height: size?.height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
          elevation: WidgetStateProperty.all(4),
          textStyle: WidgetStateProperty.all(
            Paragraph03(color: Neutral.n700).regular,
          ),
          foregroundColor: WidgetStateProperty.all(Neutral.n700),
          backgroundColor: WidgetStateProperty.all(Neutral.n100),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  static Widget textButton({
    required VoidCallback onPressed,
    required String label,
    Size? size, // Optional size param
  }) {
    return SizedBox(
      width: size?.width,
      height: size?.height,
      child: TextButton(onPressed: onPressed, child: Text(label)),
    );
  }
}
