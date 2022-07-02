import 'package:chatting_app_clone/screens/auth_screen.dart';
import 'package:chatting_app_clone/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Color calculateTextColor(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light
        ? Colors.black
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.pink,
              secondary: Colors.deepPurple,
              background: Colors.pink,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context,
         AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return const ChatScreen();
          }
          return const AuthScreen();
        },
      ),
    );
  }
}
