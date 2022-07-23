import 'package:admin_dashboard/ui/shared/widgets/buttons/google_sing_in_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/authentication_provider.dart';
import '/providers/forms/login_form_provider.dart';
import '/router/router.dart';
import '/ui/shared/widgets/buttons/custom_outlined_button.dart';
import '/ui/shared/widgets/inputs/custom_inputs.dart';
import '/ui/shared/widgets/mixins/validation_mixin.dart';

class LoginView extends StatelessWidget with ValidationMixin {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthenticationProvider>(context);

    return ChangeNotifierProvider(
        create: (context) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);

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
                    key: loginFormProvider.formKey,
                    child: Column(
                      children: [
                        //email
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (_) => onSubmitMailPassword(
                              loginFormProvider, loginProvider),
                          validator: (value) => validateEmail(value ?? ''),
                          onChanged: (value) => loginFormProvider.email = value,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'usuario@mail.com',
                              label: 'Email',
                              iconData: Icons.email_sharp),
                        ),
                        const SizedBox(height: 10),
                        //password
                        TextFormField(
                          onFieldSubmitted: (_) => onSubmitMailPassword(
                              loginFormProvider, loginProvider),
                          validator: (value) => validatePassword(value ?? ''),
                          onChanged: (value) =>
                              loginFormProvider.password = value,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: '**********',
                              label: 'Contraseña',
                              iconData: Icons.lock),
                        ),
                        const SizedBox(height: 10),

                        SizedBox(
                          width: double.infinity, // <-- match_parent
                          //   height: double.infinity, // <-- match-parent
                          child: CustomOutlinedButton(
                            onPressed: () => onSubmitMailPassword(
                                loginFormProvider, loginProvider),
                            text: 'Ingresar',
                          ),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(
                          width: double.infinity,
                          child: GoogleSignInButton(),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity, // <-- match_parent
                          //   height: double.infinity, // <-- match-parent
                          child: CustomOutlinedButton(
                            onPressed: () => Navigator.pushReplacementNamed(
                                context, Flurorouter.registerPath),
                            text: 'Registarse',
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

  void onSubmitMailPassword(LoginFormProvider loginFormProvider,
      AuthenticationProvider loginProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid) {
      loginProvider.loginUser(
          loginFormProvider.email, loginFormProvider.password);
    }
  }
}
