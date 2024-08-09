import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/firebase_options.dart';
import 'package:fooddelivery/model/restaurant.dart';
import 'package:fooddelivery/services/auth/auth_get.dart';
import 'package:fooddelivery/services/auth/login_or_register.dart';
import 'package:fooddelivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
   MultiProvider(
     providers: [
       // theme provider
       ChangeNotifierProvider(create: (context)=>ThemeProvider()),
       // Restaurant Provider
       ChangeNotifierProvider(create:(context)=> Restaurant() ),
     ],
     child: const MyApp(),
   ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const AuthGat(),
    );
  }
}
