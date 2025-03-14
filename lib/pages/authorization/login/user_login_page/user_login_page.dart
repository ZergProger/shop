import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/authorization/bloc/authorization_bloc.dart';
import 'package:shop/pages/authorization/login/user_login_page/widgets/container.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerUsername = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthorizationBloc, AuthorizationState>(
        builder: (context, state) {
          if (state is AuthorizationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AuthorizationFailure) {
            return Center(child: Text(state.error));
          } else {
            return LoginContainer(
              controllerEmail: controllerEmail,
              controllerPassword: controllerPassword,
              controllerUsername: controllerUsername,
            );
          }
        },
      ),
    );
  }
}
