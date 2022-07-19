import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import '/providers/providers.dart';
import 'package:email_validator/email_validator.dart';
import '/services/navigation_service.dart';
import '../../../models/user_data.dart';
import '/services/notifications_service.dart';

import '/ui/shared/widgets/buttons/custom_icon_button.dart';
import '/ui/shared/widgets/inputs/custom_inputs.dart';
import '/ui/shared/widgets/cards/whirte_card.dart';
import '/ui/shared/widgets/labels/custom_labels.dart';

class UserView extends StatefulWidget {
  final String uid;

  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  UserData? user;

  @override
  void initState() {
    super.initState();

    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider = Provider.of<UserFormProvider>(context, listen: false);

    usersProvider.getUserById(widget.uid).then((userResponse) {
      if (userResponse != null) {
        userFormProvider.user = userResponse;
        userFormProvider.formkey = GlobalKey<FormState>();
        setState(() {
          user = userResponse;
        });
      } else {
        NavigationService.replaceTo('/dashboard/users');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Editar Usuario",
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          if (user == null)
            WhiteCard(
                child: Container(
              alignment: Alignment.center,
              height: 300,
              child: const CircularProgressIndicator(color: Colors.green, strokeWidth: 10),
            )),
          if (user != null) _UserViewBody(),
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        // ancho de la columna
        columnWidths: const {
          0: FixedColumnWidth(250),
        },
        children: [
          TableRow(children: [
            _PhotoContainer(),
            _UserViewForm(),
          ])
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  _UserViewForm({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);

    return WhiteCard(
      title: 'Informacion Personal',
      child: Form(
        key: userFormProvider.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          TextFormField(
              initialValue: user.displayName,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Ingrese nombre de usuario';
                if (value.length < 4) return 'Muy corto...';
                return null;
              },
              onChanged: ((value) => userFormProvider.copyUserWith(name: value)),
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Nombre de usuario', label: 'Nombre', iconData: Icons.supervised_user_circle_outlined)),
          const SizedBox(height: 20),
          TextFormField(
              initialValue: user.email,
              validator: (value) {
                if (!EmailValidator.validate(value ?? '')) return 'Email no valido';
                return null;
              },
              onChanged: ((value) => userFormProvider.copyUserWith(email: value)),
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Correo electrónico', label: 'E-mail', iconData: Icons.mark_email_read_outlined)),
          const SizedBox(height: 20),
          ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 120),
              child: CustomIconButton(
                onPressed: () async {
                  final saved = await userFormProvider.updateUser();
                  if (saved) {
                    NotificationService.showSnackSuccess('Usuario ${user.displayName} actualizado!');
                    usersProvider.refreshUser(user);
                    NavigationService.replaceTo('/dashboard/users');
                  } else {
                    NotificationService.showSnackBarError('Error, no se pudo actualizar');
                  }
                },
                text: 'Guardar',
                icon: Icons.save_outlined,
              ))
        ]),
      ),
    );
  }
}

class _PhotoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;
    final image = (user.photoURL == null)
        ? const Image(image: AssetImage('assets/no-photo.png'))
        : FadeInImage.assetNetwork(
            placeholder: 'assets/loader.gif',
            image: user.photoURL!,
          );

    return WhiteCard(
      width: 250,
      child: Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Perfil', style: CustomLabels.h4),
              const SizedBox(height: 20),
              Container(
                  width: 150,
                  height: 160,
                  child: Stack(
                    children: [
                      ClipOval(child: image),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            //color: Colors.green,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white, width: 5),
                          ),
                          child: FloatingActionButton(
                            backgroundColor: Colors.green,
                            elevation: 0,
                            onPressed: () async {
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['png', 'jpg', 'jpeg'],
                                allowMultiple: false,
                              );

                              if (result != null) {
                                NotificationService.showProcessingIndicator(context);
                                final userResponse = await userFormProvider.uploadImage(
                                    '/uploads/usuarios/${user.uid}', result.files.first.bytes!);
                                Provider.of<UsersProvider>(context, listen: false).refreshUser(userResponse);
                                Navigator.of(context).pop();
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: const Icon(Icons.camera_alt_outlined, size: 30),
                          ),
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 20),
              Text(user.displayName, style: CustomLabels.h4)
            ]),
      ),
    );
  }
}
