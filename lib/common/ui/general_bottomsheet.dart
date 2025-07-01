import 'package:flutter/material.dart';

class GeneralBottomsheet {
  // Membuat class yang nantinya akan dipanggil untuk digunakan sebagai form contoh New Post untuk Thread
  // Contoh Pemakaian pada trending_presenter method addNewThread yang memanggil widget child = ThreadInput
  // yang menggunakan inputan dari widget thread_input

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
