import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:soulee/src/core/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}
