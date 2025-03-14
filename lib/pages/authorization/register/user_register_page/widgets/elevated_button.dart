import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/authorization/bloc/authorization_bloc.dart';
import 'package:shop/pages/homes/products_page/products_page.dart';
import 'package:shop/res/button_style.dart';
import 'package:shop/res/texts.dart';
import 'package:shop/res/texts_style.dart';
import 'package:shop/utils/routes_name.dart';

class RegisterElevatedButton extends StatelessWidget {
  const RegisterElevatedButton(
      {super.key,
      required this.email,
      required this.password,
      required this.username});

  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController username;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<AuthorizationBloc>().add(
              AuthorizationRegister(
                email: email.text,
                password: password.text,
                username: username.text,
              ),
            );
        if (context.read<AuthorizationBloc>().state is AuthorizationSuccess) {
          Navigator.pushReplacementNamed(context, route(ProductsPage));
        }
      },
      style: AppSButton.reg,
      child: Text(
        AppTexts.submitText,
        style: AppSTexts.regLabel,
      ),
    );
  }
}
