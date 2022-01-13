import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_commerce/src/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  static const String route = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String initValue = "Select your Birth Date";
  bool isDateSelected = false;
  late String birthDateInString;
  DateTime birthDate = DateTime.now();

  String imagePath = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: SizedBox(
              width: 320,
              child: Column(
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                      color: AppColors.secondaryColor,
                    ),
                    child: InkWell(
                      onTap: () async {
                        final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
                        if(file!=null) {
                          setState(() {
                            imagePath = file.path;
                          });
                        }
                      },
                      child: imagePath.isEmpty ? Icon(Icons.add_a_photo_outlined, color: AppColors.hintColor) : Image.file(File(imagePath)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 16),
                    child: TextFormField(
                      validator: (value)=> (value?.isEmpty ?? true) ? "required" : null,
                      decoration: InputDecoration(
                        hintText: "Emp ID",
                        hintStyle: TextStyle(fontSize: 15, color: AppColors.hintColor),
                        isDense: true,
                        // Added this
                        contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: AppColors.textColor,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 16),
                    child: TextFormField(
                      validator: (value)=> (value?.isEmpty ?? true) ? "required" : null,
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(fontSize: 15, color: AppColors.hintColor),
                        isDense: true,
                        // Added this
                        contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: AppColors.textColor,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 16),
                    child:TextFormField(
                      validator: (value)=> (value?.isEmpty ?? true) ? "required" : null,
                      decoration: InputDecoration(
                        hintText: "Phone",
                        hintStyle: TextStyle(fontSize: 15, color: AppColors.hintColor),
                        isDense: true,
                        // Added this
                        contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: AppColors.textColor,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 16),
                    child: TextFormField(
                      validator: (value)=> (value?.isEmpty ?? true) ? "required" : null,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: 15, color: AppColors.hintColor),
                        isDense: true,
                        // Added this
                        contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: AppColors.textColor,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 16),
                    child: TextField(
                      controller: dateOfBirthController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "Date of birth",
                        hintStyle: TextStyle(fontSize: 15, color: AppColors.hintColor),
                        isDense: true,
                        // Added this
                        contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      onTap: () async {
                        final DateTime? time = await showDatePicker(
                          context: context,
                          initialDate:
                              birthDate.isAfter(DateTime.now().subtract(const Duration(days: 18 * 365))) ? DateTime(2000, 1, 1) : birthDate,
                          firstDate: DateTime.now().subtract(const Duration(days: 60 * 365)),
                          lastDate: DateTime.now().subtract(const Duration(days: 18 * 365)),
                        );

                        if (time != null) {
                          setState(() {
                            birthDate = time;
                            dateOfBirthController.text = DateFormat("dd MMMM, yyyy").format(time);
                          });
                        }
                      },
                      cursorColor: AppColors.textColor,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Your Blood Group",
                        hintStyle: TextStyle(fontSize: 15, color: AppColors.hintColor),
                        isDense: true,
                        // Added this
                        contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: AppColors.textColor,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 16),
                    child: TextFormField(
                      validator: (value)=> (value?.isEmpty ?? true) ? "required" : null,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 15, color: AppColors.hintColor),
                        isDense: true,
                        // Added this
                        contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: AppColors.textColor,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 16),
                    child:TextFormField(
                      validator: (value)=> (value?.isEmpty ?? true) ? "required" : null,
                      decoration: InputDecoration(
                        hintText: "Confirm password",
                        hintStyle: TextStyle(fontSize: 15, color: AppColors.hintColor),
                        isDense: true,
                        // Added this
                        contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      cursorColor: AppColors.textColor,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16, top: 32, bottom: 16),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.textColor),
                        ),
                        onPressed: () {
                          if (formKey.currentState?.validate()??false);
                        },
                        child: Text("SUBMIT", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.backgroundColor)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
