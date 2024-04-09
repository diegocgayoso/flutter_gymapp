import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_first_app/features/auth_screen.dart';
import 'package:flutter_my_first_app/features/exercicios_tela.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_my_first_app/features/initial_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RouteScreen(),
    );
  }
}

class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return InitialScreen(
              user: snapshot.data!,
            );
          } else {
            return const AuthScreen();
          }
        });
  }
}
