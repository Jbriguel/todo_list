import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addCollaborateurContent extends StatelessWidget {
  const addCollaborateurContent({
    super.key,
    required TextEditingController collaboratorEmailController,
  }) : _collaboratorEmailController = collaboratorEmailController;

  final TextEditingController _collaboratorEmailController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.all(5.0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Nouveau collaborateur',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _collaboratorEmailController,
                decoration: InputDecoration(
                  hintText: "Entrez l'email ...",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey.withOpacity(0.1),
                  filled: true,
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                child: const Text('Annuler'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: const Text('Ajouter Collaborateur'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ])
          ]),
        ),
      ),
    );
  }
}
