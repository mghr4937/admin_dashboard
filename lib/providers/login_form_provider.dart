import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthProvider authProvider;

  LoginFormProvider(this.authProvider);

  String email = '';
  String password = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid');
      print('$email - $password');

      authProvider.login(email, password);
    } else {
      print('Form not valid');
    }
  }
}
