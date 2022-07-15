import 'package:email_validator/email_validator.dart';

class ValidationMixin {
  String? validateEmail(String value) {
    if (!EmailValidator.validate(value)) return 'Email no valido';
    return null;
  }

  String? validatePassword(String value) {
    if (value == null || value.isEmpty) return 'Ingrese su contraseña';
    if (value.length < 6) return 'Muy corta...';
    return null;
  }

  String? validateText(String value) {
    if (value.isEmpty || value.length > 3) return 'No valido';
    return null;
  }
}
