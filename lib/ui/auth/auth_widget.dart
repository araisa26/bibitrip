import 'package:bibitrip/resources/app_resources.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bibitrip/ui/auth/auth_model.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'BibiTrip',
        style: AppResources.appLogoStyle,
      )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Center(
              child: Text(
                'Вход',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ErrorMessageWidget(),
            LoginAndPasswordForm(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SignInButtonWidget(),
                SizedBox(
                  height: 70,
                ),
                TermsAndConditions(),
                PrivacyPolicy(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LoginAndPasswordForm extends StatelessWidget {
  const LoginAndPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Логин",
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: model.login,
          obscureText: false,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          style: AppResources.textFieldStylee,
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Пароль",
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: model.password,
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          style: AppResources.textFieldStylee,
        ),
      ],
    );
  }
}

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthModel>();
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 70, right: 70),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () => model.toStart(context),
          style: AppResources.buttonStyle,
          child: model.startAuthorizationLoading == true
              ? AppResources.circularProgresIndicator
              : const Text(
                  'Начать',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
        ),
      ),
    );
  }
}

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();
    return TextButton(
        onPressed: () => model.termsAndConditions(),
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(2)),
        ),
        child: const Text('Условия использования'));
  }
}

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();
    return TextButton(
        onPressed: () => model.privacyPolicy(),
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(2)),
        ),
        child: const Text('Политика конфиденциальности'));
  }
}

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthModel>();
    if (model.errorMessage == null) {
      return const SizedBox.shrink();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              model.errorMessage!,
              style: AppResources.errorMessageStyle,
            ),
          ),
        ],
      );
    }
  }
}
