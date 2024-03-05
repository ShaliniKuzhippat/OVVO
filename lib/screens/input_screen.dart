import 'dart:developer';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ovvo/screens/viewer.dart';

class InputScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerProblem = TextEditingController();
  final controllerAudience = TextEditingController();
  final controllerSolution = TextEditingController();
  final controllerProposition = TextEditingController();
  final uriEndpoint =
      "https://us-central1-ovvo-405a7.cloudfunctions.net/api/generate/";

  InputScreen({super.key});

  void submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse('$uriEndpoint${controllerSolution.text}');

      final Map<String, dynamic> data = {
        'name': controllerName.text,
        'problem': controllerProblem.text,
        'audience': controllerAudience.text,
        'solution': controllerSolution.text,
        'proposition': controllerProposition.text,
      };

      final String jsonData = jsonEncode(data);
      //headers: {'Content-Type': 'application/json'}
      //body: jsonData
      final response = await http.post(
        url,
      );

      if (response.statusCode == 200) {
        log("Data sent successfully!");
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        // Navigate to a new screen after successful submission.
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Viewer(responseData: responseData)),
        );
      } else {
        log('Failed to send data. Status code: ${response.statusCode}');
        log('Reason: ${response.reasonPhrase}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ovvo generate deck'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controllerName,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Project name'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name of your business or project';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllerProblem,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Problem statement'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the problem you are trying to solve';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllerAudience,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Target audience'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your target audience';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllerSolution,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Solution'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the solution you provide';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controllerProposition,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Value proposition'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your value proposition';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    submitForm(context);
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}