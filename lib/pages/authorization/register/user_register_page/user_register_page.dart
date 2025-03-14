import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/authorization/bloc/authorization_bloc.dart';
import 'package:shop/pages/authorization/register/user_register_page/widgets/register_container.dart';

class UserRegisterPage extends StatelessWidget {
  UserRegisterPage({super.key});

  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AuthorizationBloc, AuthorizationState>(
      builder: (context, state) {
        if (state is AuthorizationLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AuthorizationFailure) {
          return Center(child: Text(state.error));
        } else {
          return RegisterContainer(
            controllerUsername: controllerUsername,
            controllerEmail: controllerEmail,
            controllerPassword: controllerPassword,
          );
        }
      },
    ));
  }
}
