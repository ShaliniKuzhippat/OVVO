import 'preview.dart';
import 'package:flutter/material.dart';

class start_page extends StatelessWidget {
  final String fileName;
  start_page({super.key, required this.fileName});

  @override
  Widget build(BuildContext context) {
    return Preview(fileName: this.fileName);
  }
}
