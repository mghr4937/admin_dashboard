import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/utils/custom_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TournamentsView extends StatefulWidget {
  const TournamentsView({Key? key}) : super(key: key);

  @override
  State<TournamentsView> createState() => _TournamentsViewState();
}

class _TournamentsViewState extends State<TournamentsView> {
  // text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();

  final CollectionReference _tournaments =
      FirebaseFirestore.instance.collection('tournaments');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Campeonatos'),
        // ),
        // Add new product
        floatingActionButton: FloatingActionButton(
          backgroundColor: CustomColors.mainColor,
          onPressed: () => _createOrUpdate(),
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder(
          stream: _tournaments.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['name']),
                      subtitle:
                          Text('Participantes: ${documentSnapshot['size']}'),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            // Press this button to edit a single product
                            IconButton(
                                //color: CustomColors.secondaryColor,
                                icon: const Icon(Icons.edit),
                                onPressed: () =>
                                    _createOrUpdate(documentSnapshot)),
                            // This icon button is used to delete a single product
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    _deleteProduct(documentSnapshot.id)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

// This function is triggered when the floatting button or one of the edit buttons is pressed
// Adding a tournament if no documentSnapshot is passed
// If documentSnapshot != null then update an existing tournament
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _nameController.text = documentSnapshot['name'];
      _sizeController.text = documentSnapshot['size'].toString();
    } else {
      _nameController.text = '';
      _sizeController.text = '';
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                // prevent the soft keyboard from covering text fields
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _sizeController,
                  decoration: const InputDecoration(
                    labelText: 'Cantidad de participantes',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors.mainColor, // Background color
                    onPrimary: Colors.black, // Text Color (Foreground color)
                  ),
                  child: Text(action == 'create' ? 'Crear' : 'Actualizar'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final double? size = double.tryParse(_sizeController.text);
                    if (size != null) {
                      if (action == 'create') {
                        // Persist a new product to Firestore
                        await _tournaments.add({"name": name, "size": size});
                      }

                      if (action == 'update') {
                        // Update the product
                        await _tournaments
                            .doc(documentSnapshot!.id)
                            .update({"name": name, "size": size});
                      }

                      // Clear the text fields
                      _nameController.text = '';
                      _sizeController.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // Deleteing a product by id
  Future<void> _deleteProduct(String tournamentId) async {
    await _tournaments.doc(tournamentId).delete();

    // Show a snackbar
    NotificationService.showSnackBarSuccess("Agregado correctamente");
  }
}
