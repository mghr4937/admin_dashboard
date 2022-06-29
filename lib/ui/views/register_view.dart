import 'package:flutter/material.dart'; //
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/shared/buttons/curtom_outlined_button.dart';
import 'package:admin_dashboard/ui/shared/buttons/link_text.dart';
import 'package:admin_dashboard/ui/shared/inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RegisterFormProvider(),
        child: Builder(builder: (context) {
          final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

          return Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black,
            child: Center(
                child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Ingrese nombre de usuario';
                          if (value.length < 4) return 'Muy corto...';
                          return null;
                        },
                        onChanged: (value) => registerFormProvider.name = value,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Ingrese su nombre', label: 'Nombre', iconData: Icons.sports_soccer_sharp),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) return 'Email no valido';
                          return null;
                        },
                        onChanged: (value) => registerFormProvider.email = value,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'usuario@mail.com', label: 'Email', iconData: Icons.email_sharp),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Ingrese su contraseña';
                          if (value.length < 6) return 'Muy corta...';
                          return null;
                        },
                        onChanged: (value) => registerFormProvider.password = value,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: '**********', label: 'Contraseña', iconData: Icons.lock),
                      ),
                      const SizedBox(height: 20),
                      CustomOutlinedButton(
                        onPressed: () {
                          registerFormProvider.validateForm();
                        },
                        text: 'Kick Off',
                      ),
                      LinkText(
                        text: 'Ir al Login',
                        onPress: () {
                          Navigator.pushNamed(context, Flurorouter.loginPath);
                        },
                        color: Colors.blue,
                      )
                    ],
                  )),
            )),
          );
        }));
  }
}
