import 'package:admin_dashboard/ui/shared/widgets/buttons/link_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/authentication_provider.dart';
import '/providers/forms/login_form_provider.dart';
import '/router/router.dart';
import '/ui/shared/widgets/buttons/custom_outlined_button.dart';
import '/ui/shared/widgets/inputs/custom_inputs.dart';
import '/ui/shared/widgets/mixins/validation_mixin.dart';
import '../../../utils/custom_colors.dart';
import '../../shared/widgets/buttons/google_sing_in_button.dart';

class LoginView extends StatelessWidget with ValidationMixin {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthenticationProvider>(context);

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
                              loginFormProvider, _authProvider),
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
                              loginFormProvider, _authProvider),
                          validator: (value) => validatePassword(value ?? ''),
                          onChanged: (value) =>
                              loginFormProvider.password = value,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: '**********',
                              label: 'Contrase??a',
                              iconData: Icons.lock),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          alignment: Alignment.centerRight,
                          child: LinkText(
                            text: 'Olvid?? mi contrase??a',
                            onPress: () {
                              //    Navigator.pushReplacementNamed(context, Flurorouter.registerPath);
                              _authProvider.resetPassword(
                                  email: loginFormProvider.email);
                            },
                            color: CustomColors.mainColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity, // <-- match_parent
                          //   height: double.infinity, // <-- match-parent
                          child: CustomOutlinedButton(
                            onPressed: () => onSubmitMailPassword(
                                loginFormProvider, _authProvider),
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
                            color: CustomColors.secondaryColor,
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
      loginProvider.login(loginFormProvider.email, loginFormProvider.password);
    }
  }
}
