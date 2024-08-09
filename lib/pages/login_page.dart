import 'package:flutter/material.dart';
import 'package:fooddelivery/components/my_button.dart';
import 'package:fooddelivery/components/my_textfield.dart';
import 'package:fooddelivery/services/auth/auth_services.dart';


class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text editing controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  // Login method
  void login()async{
   // get instance of auth service
    final _authService= AuthServices();
    //try sign in
    try{
      await _authService.signInwithEmail(emailController.text,
          passController.text,);

    }
    // display ant error
    catch(e){
      showDialog(context: context, builder:(context)=>AlertDialog(
        title: Text(e.toString()),
      ), );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 20),
            // massage app slogan
            Text(
              "Food Delivery App",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(height: 20),
            // email text field
            MyTextField(
                controller: emailController,
                hintText: "Enter your Email",
                obscureText: false),
            //password text field
            MyTextField(
              controller: passController,
              hintText: "Enter your password",
              obscureText: true,
            ),
            const SizedBox(height: 20),
            //sign in button
            MyButton(
              onTap:login,
              text: "Sign In",
            ),
            const SizedBox(height: 20),
            // not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
