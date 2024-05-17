import 'package:flutter/material.dart';
import 'package:patterns_codelab/data.dart';

void main() {
  runApp(const DocumentApp());
}

class DocumentApp extends StatelessWidget {
  const DocumentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: DocumentScreen(
        document: Document(),
      ),
    );
  }
}

class DocumentScreen extends StatelessWidget {
  final Document document;

  const DocumentScreen({
    required this.document,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final metaData = document.metaData;
    return Scaffold(
      appBar: AppBar(
        title: Text(metaData.$1),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Last Modified: ${metaData.date}'),
          ),
        ],
      ),
    );
  }
}
