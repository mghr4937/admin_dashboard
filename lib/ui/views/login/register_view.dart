import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/authentication_provider.dart';
import '/providers/forms/register_form_provider.dart';
import '/router/router.dart';
import '/ui/shared/widgets/buttons/custom_outlined_button.dart';
import '/ui/shared/widgets/inputs/custom_inputs.dart';
import '/ui/shared/widgets/mixins/validation_mixin.dart';

class RegisterView extends StatelessWidget with ValidationMixin {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RegisterFormProvider(),
        child: Builder(builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          final loginFormProvider =
              Provider.of<AuthenticationProvider>(context, listen: false);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                  child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: registerFormProvider.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.name,
                          validator: (value) => validateText(value ?? ''),
                          onChanged: (value) =>
                              registerFormProvider.name = value,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su nombre',
                              label: 'Nombre',
                              iconData: Icons.sports_soccer_sharp),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => validateEmail(value ?? ''),
                          onChanged: (value) =>
                              registerFormProvider.email = value,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'usuario@mail.com',
                              label: 'Email',
                              iconData: Icons.email_sharp),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          validator: (value) => validatePassword(value ?? ''),
                          onChanged: (value) =>
                              registerFormProvider.password = value,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: '**********',
                              label: 'Contraseña',
                              iconData: Icons.lock),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          child: CustomOutlinedButton(
                            onPressed: () {
                              final validForm =
                                  registerFormProvider.validateForm();
                              if (!validForm) return;
                              loginFormProvider.signUpUser(
                                registerFormProvider.email,
                                registerFormProvider.password,
                                registerFormProvider.name,
                              );
                            },
                            text: 'Kick Off',
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: CustomOutlinedButton(
                            onPressed: () => Navigator.pushReplacementNamed(
                                context, Flurorouter.loginPath),
                            text: 'Volver al Login',
                            color: Colors.orangeAccent.shade700,
                          ),
                        ),
                      ],
                    )),
              )),
            ),
          );
        }));
  }
}
