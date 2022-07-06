import 'package:admin_dashboard/ui/shared/widgets/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/shared/widgets/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/models/user.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/cards/whirte_card.dart';
import 'package:admin_dashboard/ui/shared/widgets/labels/custom_labels.dart';

class UserView extends StatefulWidget {
  final String uid;

  const UserView({Key? key, required this.uid}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  User? user;

  @override
  void initState() {
    super.initState();

    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    usersProvider.getUserById(widget.uid).then((userResponse) => setState(() => user = userResponse));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Usuario",
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
          if (user != null) const _UserViewBody(),
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody({
    Key? key,
  }) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: 'Informacion Personal',
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Column(children: [
          TextFormField(
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Nombre de usuario', label: 'Nombre', iconData: Icons.supervised_user_circle_outlined)),
          const SizedBox(height: 20),
          TextFormField(
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Correo electrónico', label: 'E-mail', iconData: Icons.mark_email_read_outlined)),
          const SizedBox(height: 20),
          ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 120),
              child: CustomIconButton(
                onPressed: () {},
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
    return WhiteCard(
      width: 250,
      child: Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Profile', style: CustomLabels.h4),
              const SizedBox(height: 20),
              Container(
                  width: 150,
                  height: 160,
                  child: Stack(
                    children: [
                      const ClipOval(child: Image(image: AssetImage('assets/no-photo.png'))),
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
                            onPressed: () {},
                            child: const Icon(Icons.camera_alt_outlined, size: 30),
                          ),
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 20),
              Text('Nombre', style: CustomLabels.h4)
            ]),
      ),
    );
  }
}
