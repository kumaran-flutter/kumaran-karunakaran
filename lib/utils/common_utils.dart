import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonUtils {
  static Widget getSvgIcon(
    String iconName, {
    double? size,
    bool isNeedColor = false,
    Color? color,
  }) {
    return SvgPicture.asset(
      iconName,
      width: size ?? 24.0,
      height: size ?? 24.0,
      fit: BoxFit.contain,
      colorFilter: isNeedColor
          ? ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn)
          : null,
    );
  }

  static void downloadResume(BuildContext context, [String? resumeUrl]) {
    final url = resumeUrl ?? 'https://drive.google.com/file/d/1PRQAnSMygnc5u-eC9Hu4kyeh5KbgZ9FY/view?usp=sharing';
    
    launchUrlFunc(url);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.download_rounded, color: Colors.white),
            SizedBox(width: 8),
            Text('Opening resume...'),
          ],
        ),
        backgroundColor: Colors.blue.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  static Future<void> launchUrlFunc(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
