import 'package:flutter/material.dart';

class GeneralBottomsheet {
  // This class is intended to be called and used as the 'New Post' form for a Thread.
  // For an example, see the `addNewThread` method in `trending_presenter`.
  // It calls a widget whose child is `ThreadInput`, which is responsible for the input.

  static void showGeneralbottomsheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return child;
      },
    );
  }
}
