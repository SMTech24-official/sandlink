import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sandlink/core/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initStorage();
  runApp(const SandLink());
}

Future<void> initStorage() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Open the box
  await Hive.openBox('storage');
}
