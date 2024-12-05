import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/wrappers/widget_custom_animator.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class AppSnackBar {
  static AppSnackBar? _instance;

  AppSnackBar._();

  factory AppSnackBar() {
    return _instance ??= AppSnackBar._();
  }

  void showSnackBar({
    required String title,
    required String content,
    required ContentType contentType,
    required Color color,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(getSnackBar(
          title: title,
          content: content,
          contentType: contentType,
          color: color));
  }
}

SnackBar getSnackBar({
  required String title,
  required String content,
  required ContentType contentType,
  required Color color,
}) {
  return SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    dismissDirection: DismissDirection.down,
    content: WidgetCustomAnimator(
      incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(
          duration: const Duration(seconds: 1), scale: 0.4, opacity: 0.1),
      childWidget: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              content,
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    ),
  );
}
