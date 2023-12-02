import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyA6iI-DWru6OylA58srsbJoTd4dCTphWOQ",
          appId: "1:435700051337:android:2e6566fc000e74f93d8558",
          messagingSenderId: "435700051337",
          projectId: "flutter-firebase-app-95c01"));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(new Viewer());
  });

  //runApp(const Viewer());
}

class Viewer extends StatelessWidget {
  const Viewer({super.key});
  final String _url_ppt =
      'https://brand.uconn.edu/wp-content/uploads/sites/2820/2019/08/white-oakleaf-standard-temp.pptx';

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pitch Deck'),
          centerTitle: true,
        ),
        body: Center(
          child: start_page(),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            print("button pressed");
            FileDownloader.downloadFile(
                url: _url_ppt,
                onDownloadError: (String error) {
                  print('Error while downloading: $error');
                },
                onDownloadCompleted: (path) async {
                  final File file = File(path);
                  print(file);

                  Fluttertoast.showToast(
                      msg: 'PowerPoint File Downloaded!',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 2,
                      backgroundColor: const Color.fromARGB(255, 248, 7, 7),
                      textColor: Color.fromARGB(255, 176, 238, 4),
                      fontSize: 16.0);
                  await Future.delayed(const Duration(seconds: 4));
                  print('Displayed the popup');
                  Navigator.pop(context);
                });
          },
          label: Text('Download'),
          icon: Icon(Icons.arrow_downward_rounded),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
