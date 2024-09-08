import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:developer';
import 'dart:io';

Future<String> chatting(String inputText) async {
  var apiKey = dotenv.get('GEMINI_API_KEY');
  if (apiKey == null) {
    log('API Key取得失敗');
    exit(1);
  }

  final genModel = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  final content = [Content.text(inputText)];

  final response = await genModel.generateContent(content);
  String resText = response.text ?? 'Gemini返答失敗';
  return resText;
}
