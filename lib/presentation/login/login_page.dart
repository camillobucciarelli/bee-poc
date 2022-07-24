import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection.dart';
import '../apiaries/apiaries_page.dart';
import 'login_form.dart';
import 'state/login_cubit.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => injector(),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listenWhen: (previous, current) => current is LoginSuccess,
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                ApiariesPage.routeName,
                (route) => false,
              );
            }
          },
          buildWhen: (previous, current) => current is! LoginSuccess,
          builder: (context, state) {
            if (state is LoginFailure) {
              return _buildErrorMessage();
            }
            return const LoginForm();
          },
        ),
      ),
    );
  }

  Widget _buildErrorMessage() {
    return const Center(
      child: Text('Login error'),
    );
  }
}
