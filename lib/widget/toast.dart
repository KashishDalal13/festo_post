import 'package:flutter/material.dart';

class Toast {

  static final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();

  static toast({required String msg}) {
    return snackBarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(msg),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}