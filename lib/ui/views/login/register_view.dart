import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/router/router.dart';
import '/providers/forms/register_form_provider.dart';
import '/providers/login_provider.dart';
import '/ui/shared/widgets/mixins/validation_mixin.dart';
import '/ui/shared/widgets/buttons/curtom_outlined_button.dart';
import '/ui/shared/widgets/buttons/link_text.dart';
import '/ui/shared/widgets/inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget with ValidationMixin {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RegisterFormProvider(),
        child: Builder(builder: (context) {
          final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);
          final loginFormProvider = Provider.of<LoginProvider>(context, listen: false);

          return Container(
            margin: const EdgeInsets.only(top: 50),
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
                        keyboardType: TextInputType.name,
                        validator: (value) => validateText(value ?? ''),
                        onChanged: (value) => registerFormProvider.name = value,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Ingrese su nombre', label: 'Nombre', iconData: Icons.sports_soccer_sharp),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => validateEmail(value ?? ''),
                        onChanged: (value) => registerFormProvider.email = value,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'usuario@mail.com', label: 'Email', iconData: Icons.email_sharp),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator: (value) => validatePassword(value ?? ''),
                        onChanged: (value) => registerFormProvider.password = value,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: '**********', label: 'Contraseña', iconData: Icons.lock),
                      ),
                      const SizedBox(height: 10),
                      CustomOutlinedButton(
                        onPressed: () {
                          final validForm = registerFormProvider.validateForm();
                          if (!validForm) return;
                          loginFormProvider.register(
                              registerFormProvider.name, registerFormProvider.email, registerFormProvider.password);
                        },
                        text: 'Kick Off',
                      ),
                      const SizedBox(height: 10),
                      LinkText(
                        text: 'Ir al Login',
                        onPress: () {
                          Navigator.pushReplacementNamed(context, Flurorouter.loginPath);
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
