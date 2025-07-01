import 'package:flutter/material.dart';

class GeneralBottomsheet {
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
