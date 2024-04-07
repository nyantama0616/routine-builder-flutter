import 'package:flutter/material.dart';
import "./app.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  await dotenv.load(fileName: ".env.development");
  tz.initializeTimeZones();
  runApp(const ProviderScope(child: App()));
}
