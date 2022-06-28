import 'package:admin_dashboard/ui/buttons/curtom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

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
              decoration: _buildInputDecoration(
                  hint: 'usuario@mail.com',
                  label: 'Email',
                  iconData: Icons.email_sharp),
            ),
            const SizedBox(height: 20),
            TextFormField(
              //validator: (),
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: _buildInputDecoration(
                  hint: '**********',
                  label: 'Contraseña',
                  iconData: Icons.lock),
            ),
            const SizedBox(height: 20),
            CustomOutlinedButton(
              onPressed: () {},
              text: 'Ingresar',
            ),
            LinkText(
              text: 'Registarse',
              onPress: () {},
              color: Colors.blue,
            )
          ],
        )),
      )),
    );
  }

  InputDecoration _buildInputDecoration(
      {required String hint,
      required String label,
      required IconData iconData}) {
    return InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(iconData, color: Colors.blue));
  }
}
