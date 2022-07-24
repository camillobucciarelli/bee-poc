import 'state/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../theme/theme.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginForm = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      validators: [Validators.required],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: ReactiveForm(
        formGroup: _loginForm,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(Dimens.spacingL),
            shrinkWrap: true,
            children: <Widget>[
              const FlutterLogo(size: 100),
              const SizedBox(height: Dimens.spacingM),
              _email(),
              const SizedBox(height: Dimens.spacingM),
              _password(),
              const SizedBox(height: Dimens.spacingM),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _email() {
    return ReactiveTextField<String>(
      formControlName: 'email',
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _password() {
    return ReactiveTextField<String>(
      formControlName: 'password',
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: _loginAction,
          child: state is LoginLoading
              ? const SizedBox(
                  height: 10,
                  width: 10,
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : const Text('Login'),
        );
      },
    );
  }

  void _loginAction() {
    FocusScope.of(context).unfocus();
    _loginForm.markAllAsTouched();
    if (_loginForm.valid) {
      context.read<LoginCubit>().login(_loginForm.value);
    }
  }
}
