import 'package:flutter/material.dart';
import 'package:shop/pages/authorization/register/user_register_page/widgets/elevated_button.dart';
import 'package:shop/pages/authorization/register/user_register_page/widgets/text_form.dart';
import 'package:shop/res/texts_style.dart';

class RegisterContainer extends StatelessWidget {
  const RegisterContainer(
      {super.key,
      required this.controllerUsername,
      required this.controllerEmail,
      required this.controllerPassword});

  final TextEditingController controllerUsername;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 315,
        height: 559,
        color: const Color.fromARGB(255, 255, 196, 1),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 290,
              height: 45,
              color: const Color(0xFFFFDA62),
              child: Center(
                child: const Text(
                  'Register user',
                  style: AppSTexts.regTitle,
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Form(
              child: Column(
                children: [
                  TextForm(
                      controller: controllerUsername,
                      decoration: InputDecoration(
                          labelText: 'Enter username',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      width: 270),
                  const SizedBox(
                    height: 10,
                  ),
                  TextForm(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                          labelText: 'Enter Email',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      width: 250),
                  const SizedBox(
                    height: 5,
                  ),
                  TextForm(
                      controller: controllerPassword,
                      decoration: InputDecoration(
                          labelText: 'Enter Password',
                          labelStyle: AppSTexts.regLabel,
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      width: 250),
                  const SizedBox(
                    height: 40,
                  ),
                  RegisterElevatedButton(
                      email: controllerEmail,
                      password: controllerPassword,
                      username: controllerUsername),
                  const SizedBox(
                    height: 170,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
