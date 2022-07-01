import 'package:admin_dashboard/providers/login_provider.dart';
import 'package:flutter/material.dart'; //
import 'package:provider/provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/shared/widgets/buttons/curtom_outlined_button.dart';
import 'package:admin_dashboard/ui/shared/widgets/buttons/link_text.dart';
import 'package:admin_dashboard/ui/shared/widgets/inputs/custom_inputs.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context);

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
                        TextFormField(
                          validator: (value) {
                            //if (!EmailValidator.validate(value ?? '')) return 'Email no valido';
                            return null;
                          },
                          onChanged: (value) => loginFormProvider.email = value,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'usuario@mail.com', label: 'Email', iconData: Icons.email_sharp),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            //if (value == null || value.isEmpty) return 'Ingrese su contraseña';
                            //if (value.length < 6) return 'Muy corta...';
                            return null;
                          },
                          onChanged: (value) => loginFormProvider.password = value,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: '**********', label: 'Contraseña', iconData: Icons.lock),
                        ),
                        const SizedBox(height: 20),
                        CustomOutlinedButton(
                          onPressed: () {
                            final isValid = loginFormProvider.validateForm();
                            if (isValid) authProvider.login(loginFormProvider.email, loginFormProvider.password);
                          },
                          text: 'Ingresar',
                        ),
                        const SizedBox(height: 20),
                        LinkText(
                          text: 'Registarse',
                          onPress: () {
                            Navigator.pushNamed(context, Flurorouter.registerPath);
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
}
