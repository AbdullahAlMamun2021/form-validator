import 'package:flutter/material.dart';
import 'package:food_commerce/src/utils/app_colors.dart';

class ForgotScreen extends StatefulWidget {
  static const String route = '/forgot';

  const ForgotScreen({Key? key}) : super(key: key);

  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    size: 25,
                    color: Colors.indigo,
                  ),
                  label: Text("Email"),
                  hintText: 'mamun.piistech@gmail.com',
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),

                  isDense: true,
                  // Added this
                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                ),
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
                  ),
                  onPressed: () {},
                  child: const Text("SUBMIT"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
