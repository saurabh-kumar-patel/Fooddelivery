import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/home_page.dart';
import 'package:fooddelivery/services/auth/login_or_register.dart';

class AuthGat extends StatelessWidget{
  const AuthGat({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          // user is logged in
          if(snapshot.hasData){
            return  const HomePage();
          }
          // user is Not logged in
          else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}