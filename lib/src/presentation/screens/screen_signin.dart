import 'package:flutter/material.dart';
import 'package:food_commerce/src/utils/app_colors.dart';

class SignInScreen extends StatefulWidget {
  static const String route = '/signIn';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's sign you in.",
                      style: TextStyle(fontSize: 35, color: AppColors.textColor, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Welcome back.", style: TextStyle(fontSize: 20, color: AppColors.textColor)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("You've been missed!", style: TextStyle(fontSize: 20, color: AppColors.textColor)),
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16, top: 16),
                      child: TextFormField(
                        validator: (value)=> (value?.isEmpty ?? true) ? "required" : null,
                        decoration: InputDecoration(
                          hintText: "phone,email or username",
                          hintStyle: TextStyle(fontSize: 15, color: AppColors.hintColor),

                          isDense: true,
                          // Added this
                          contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16, top: 16),
                      child: TextFormField(
                        validator: (value)=> (value?.isEmpty ?? true) ? "required" : null,
                        decoration: InputDecoration(
                          hintText: "password",
                          hintStyle: TextStyle(fontSize: 15, color: AppColors.hintColor),

                          isDense: true,
                          // Added this
                          contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 70,
                      ),
                      Text("Don't have an account?", style: TextStyle(color: AppColors.hintColor)),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: AppColors.textColor,
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          if(formKey.currentState?.validate() ?? false) {
                            ///todo: navigate to dashboard
                          }
                        },
                        child: Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.backgroundColor)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
