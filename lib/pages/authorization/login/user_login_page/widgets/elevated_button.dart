import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/authorization/bloc/authorization_bloc.dart';
import 'package:shop/pages/homes/products_page/products_page.dart';
import 'package:shop/res/button_style.dart';
import 'package:shop/res/texts.dart';
import 'package:shop/res/texts_style.dart';
import 'package:shop/utils/routes_name.dart';

class LoginElevatedButton extends StatelessWidget {
  const LoginElevatedButton({
    super.key,
    required this.email,
    required this.password,
  });

  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthorizationBloc, AuthorizationState>(
      listener: (context, state) {
        if (state is AuthorizationSuccess) {
          Navigator.pushReplacementNamed(context, route(ProductsPage));
        } else if (state is AuthorizationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthorizationBloc>().add(
                AuthorizationLogin(
                  email: email.text,
                  password: password.text,
                ),
              );
          Navigator.pushReplacementNamed(context, route(ProductsPage));
        },
        style: AppSButton.reg,
        child: Text(
          AppTexts.submitText,
          style: AppSTexts.regLabel,
        ),
      ),
    );
  }
}
