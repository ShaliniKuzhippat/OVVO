import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Preview extends StatefulWidget {
  final String fileName;
  Preview({super.key, required this.fileName});


  @override
  State<Preview> createState() => _PreviewState(fileName: this.fileName);
}

class _PreviewState extends State<Preview> {
  final String _url_pdf = 'https://www.africau.edu/images/default/sample.pdf';
  final String fileName;
  _PreviewState({required this.fileName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfPdfViewer.network(fileName),
    );
  }
}

