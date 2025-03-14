import 'package:flutter/material.dart';
import 'package:shop/pages/authorization/login/user_login_page/widgets/elevated_button.dart';
import 'package:shop/pages/authorization/register/user_register_page/user_register_page.dart';
import 'package:shop/pages/authorization/register/user_register_page/widgets/text_form.dart';
import 'package:shop/res/texts_style.dart';
import 'package:shop/utils/routes_name.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer(
      {super.key,
      required this.controllerEmail,
      required this.controllerPassword,
      required this.controllerUsername});

  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;
  final TextEditingController controllerUsername;

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
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
                  'Login user',
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
                      controller: widget.controllerUsername,
                      decoration: InputDecoration(
                          labelText: 'Enter username',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      width: 270),
                  const SizedBox(
                    height: 10,
                  ),
                  TextForm(
                      controller: widget.controllerEmail,
                      decoration: InputDecoration(
                          labelText: 'Enter Email',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      width: 250),
                  const SizedBox(
                    height: 5,
                  ),
                  TextForm(
                      controller: widget.controllerPassword,
                      decoration: InputDecoration(
                          labelText: 'Enter Password',
                          labelStyle: AppSTexts.regLabel,
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      width: 250),
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    height: 170,
                  ),
                  LoginElevatedButton(
                    email: widget.controllerEmail,
                    password: widget.controllerPassword,
                    username: widget.controllerUsername,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, route(UserRegisterPage));
                      },
                      child: Text(
                        'register user',
                        style: AppSTexts.regButton,
                      )),
                  const SizedBox(
                    height: 5,
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
