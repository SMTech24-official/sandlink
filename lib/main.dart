import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sandlink/core/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initStorage();
  await GetStorage.init();
  runApp(const SandLink());
}

Future<void> initStorage() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Open the box
  await Hive.openBox('storage');
}
