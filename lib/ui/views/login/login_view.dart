import 'package:admin_dashboard/ui/shared/widgets/buttons/google_sing_in_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ui/shared/widgets/mixins/validation_mixin.dart';
import '/router/router.dart';
import '/providers/authentication_provider.dart';
import '/providers/forms/login_form_provider.dart';
import '/ui/shared/widgets/buttons/curtom_outlined_button.dart';
import '/ui/shared/widgets/buttons/link_text.dart';
import '/ui/shared/widgets/inputs/custom_inputs.dart';

class LoginView extends StatelessWidget with ValidationMixin {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthenticationProvider>(context);

    return ChangeNotifierProvider(
        create: (context) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.black,
              child: Center(
                  child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: loginFormProvider.formKey,
                    child: Column(
                      children: [
                        //email
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (_) => onSubmitMailPasswond(loginFormProvider, loginProvider),
                          validator: (value) => validateEmail(value ?? ''),
                          onChanged: (value) => loginFormProvider.email = value,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'usuario@mail.com', label: 'Email', iconData: Icons.email_sharp),
                        ),
                        const SizedBox(height: 10),
                        //password
                        TextFormField(
                          onFieldSubmitted: (_) => onSubmitMailPasswond(loginFormProvider, loginProvider),
                          validator: (value) => validatePassword(value ?? ''),
                          onChanged: (value) => loginFormProvider.password = value,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: '**********', label: 'Contraseña', iconData: Icons.lock),
                        ),
                        const SizedBox(height: 10),

                        SizedBox(
                          width: double.infinity, // <-- match_parent
                          //   height: double.infinity, // <-- match-parent
                          child: CustomOutlinedButton(
                            onPressed: () => onSubmitMailPasswond(loginFormProvider, loginProvider),
                            text: 'Ingresar',
                          ),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(
                          width: double.infinity,
                          child: GoogleSignInButton(),
                        ),
                        const SizedBox(height: 10),

                        LinkText(
                          text: 'Registarse',
                          onPress: () {
                            Navigator.pushReplacementNamed(context, Flurorouter.registerPath);
                          },
                          color: Colors.blue,
                        )
                      ],
                    )),
              )),
            ),
          );
        }));
  }

  void onSubmitMailPasswond(LoginFormProvider loginFormProvider, AuthenticationProvider loginProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid) loginProvider.loginUser(loginFormProvider.email, loginFormProvider.password);
  }
}
