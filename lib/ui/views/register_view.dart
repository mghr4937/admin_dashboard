import 'package:flutter/material.dart'; //
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/shared/buttons/curtom_outlined_button.dart';
import 'package:admin_dashboard/ui/shared/buttons/link_text.dart';
import 'package:admin_dashboard/ui/shared/inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black,
      child: Center(
          child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 370),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              //validator: (),
              style: const TextStyle(color: Colors.white),
              decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese su nombre',
                  label: 'Nombre',
                  iconData: Icons.sports_soccer_sharp),
            ),
            const SizedBox(height: 20),
            TextFormField(
              //validator: (),
              style: const TextStyle(color: Colors.white),
              decoration: CustomInputs.loginInputDecoration(
                  hint: 'usuario@mail.com',
                  label: 'Email',
                  iconData: Icons.email_sharp),
            ),
            const SizedBox(height: 20),
            TextFormField(
              //validator: (),
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: CustomInputs.loginInputDecoration(
                  hint: '**********',
                  label: 'Contraseña',
                  iconData: Icons.lock),
            ),
            const SizedBox(height: 20),
            CustomOutlinedButton(
              onPressed: () {},
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
  }
}
