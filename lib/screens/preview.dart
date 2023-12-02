import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  final String _url_pdf = 'https://www.africau.edu/images/default/sample.pdf';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfPdfViewer.network(_url_pdf),
    );
  }
}
