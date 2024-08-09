import 'package:flutter/material.dart';
import 'package:fooddelivery/services/auth/auth_services.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPageState extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPageState({
    super.key,
    required this.onTap,
  });
  @override
  State<RegisterPageState> createState() => _RegisterPageStateState();
}

class _RegisterPageStateState extends State<RegisterPageState> {
  // text editing controller
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();
  TextEditingController ConfirmpassController = TextEditingController();

  void register() async {
    // get auth services
    final _authSerivce = AuthServices();
    // check if password match -> create user
    if (passController.text == ConfirmpassController.text) {
      //try creating user
      try {
        await _authSerivce.signUpwithEmail(
          emailController.text,
          passController.text,
        );
      }
      // display any error
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    // if password don't match -> show error
    else {
      showDialog(
        context: (context),
        builder: (context) => const AlertDialog(
          title: Text("Password don't match "),
        ),
      );
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
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 10),
            // massage app slogan
            Text(
              "Let's create an account for you ",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(height: 12),
            // email text field
            MyTextField(
                controller: emailController,
                hintText: "Enter your Email",
                obscureText: false),
            const SizedBox(height: 10),
            //password text field
            MyTextField(
              controller: passController,
              hintText: "Enter your password",
              obscureText: true,
            ),
            const SizedBox(height: 10),
            // Confirm Password
            MyTextField(
              controller: ConfirmpassController,
              hintText: "Confirm password",
              obscureText: true,
            ),
            const SizedBox(height: 15),
            //sign in button
            MyButton(
              onTap: register,
              text: "Sign Up",
            ),
            const SizedBox(height: 10),
            // already have a account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have a account?",
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
                    "Login now",
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
