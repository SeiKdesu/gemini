import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemini/get_api.dart';

Future main() async {
  // .envファイルを読み込み(この1行を追加)
  await dotenv.load(fileName: ".env");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Gemini Text Generator')),
        body: Center(
          child: FutureBuilder<String>(
            future: chatting('こんにちは、Gemini!'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text(snapshot.data ?? 'レスポンスなし');
              }
            },
          ),
        ),
      ),
    );
  }
}
