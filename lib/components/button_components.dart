import 'package:flutter/material.dart';
import 'package:kumaran_k_portfolio/styles/styles.dart';

class ButtonComponents {
  static Widget filledButton({
    required VoidCallback onPressed,
    required String label,
    Size? size, // Optional size param
    IconData? icon,
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
          // Add padding to ensure enough space for content
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: icon != null ? 12 : 16,
              vertical: 8,
            ),
          ),
        ),
        onPressed: onPressed,
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 16),
                  SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            : Text(label, overflow: TextOverflow.ellipsis),
      ),
    );
  }

  static Widget elevatedButton({
    required VoidCallback onPressed,
    required String label,
    Size? size, // Optional size param
    IconData? icon,
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
          // Add padding to ensure enough space for content
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: icon != null ? 12 : 16,
              vertical: 8,
            ),
          ),
        ),
        onPressed: onPressed,
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 16),
                  SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            : Text(label, overflow: TextOverflow.ellipsis),
      ),
    );
  }

  static Widget textButton({
    required VoidCallback onPressed,
    required String label,
    Size? size, // Optional size param
    IconData? icon,
  }) {
    return SizedBox(
      width: size?.width,
      height: size?.height,
      child: TextButton(
        style: ButtonStyle(
          // Add padding to ensure enough space for content
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: icon != null ? 8 : 12,
              vertical: 6,
            ),
          ),
        ),
        onPressed: onPressed,
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 16),
                  SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            : Text(label, overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
