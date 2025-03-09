import 'package:flutter/material.dart';
import 'package:shop/pages/authorization/register/admin_register_page/admin_register_page.dart';
import 'package:shop/pages/authorization/register/user_register_page/widgets/text_form.dart';
import 'package:shop/res/button_style.dart';
import 'package:shop/res/texts.dart';
import 'package:shop/res/texts_style.dart';
import 'package:shop/utils/routes_name.dart';

class UserRegisterPage extends StatelessWidget {
  UserRegisterPage({super.key});

  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
                  ElevatedButton(
                    onPressed: () {},
                    style: AppSButton.reg,
                    child: Text(
                      AppTexts.submitText,
                      style: AppSTexts.regLabel,
                    ),
                  ),
                  const SizedBox(
                    height: 170,
                  ),
                  Row(
                    children: [
                      Text('you want '),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, route(AdminRegisterPage));
                          },
                          child: Text(
                            'register admin',
                            style: AppSTexts.regButton,
                          )),
                      Text(', you have account, '),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, route(AdminRegisterPage));
                          },
                          child: Text(
                            'login user',
                            style: AppSTexts.regButton,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
