// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoadingAlertDialog extends StatelessWidget {
  final String mensaje;
  const LoadingAlertDialog({Key? key, required this.mensaje}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[400],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // CircularProgressIndicator(),
          const SizedBox(
            height: 10,
          ),
          Text(
            mensaje,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
