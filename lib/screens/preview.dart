import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  final String _url_pdf = 'https://www.africau.edu/images/default/sample.pdf';
  String _openResult = 'No file opened';

  Future<void> openFile() async {
    FilePickerResult? fileResult = await FilePicker.platform.pickFiles();
    if (fileResult != null && fileResult.files.single.path != null) {
      final result = await OpenFile.open(fileResult.files.single.path);
      setState(() {
        _openResult = "type=${result.type}  message=${result.message}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: SfPdfViewer.network(_url_pdf), // Adjust this flex factor to change the space allocation
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Open result: $_openResult'),
                  ),
                  ElevatedButton(
                    onPressed: openFile,
                    child: const Text('Open PPTX File'),
                  ),
                ],
              ),
            ), // Adjust this flex factor to change the space allocation
          ),
        ],
      ),
    );
  }
}
