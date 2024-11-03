import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class addTaskContent extends StatefulWidget {
  addTaskContent({
    super.key,
  });

  @override
  State<addTaskContent> createState() => _addTaskContentState();
}

class _addTaskContentState extends State<addTaskContent> {
  final TextEditingController _titreController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      cancelText: "Fermer",
      confirmText: "Confirmer",
      helpText: "Sélectionner une date",
      
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Ajouter une tâche',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _titreController,
                decoration: InputDecoration(
                  hintText: "Saisissez titre ...",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey.withOpacity(0.1),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText:
                          DateFormat('dd MMMM, yyyy').format(selectedDate),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor: Colors.grey.withOpacity(0.1),
                      filled: true,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey.shade100),
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Icon(
                      Icons.calendar_month,
                      color: Colors.deepPurple,
                      size: 24.0,
                    ),
                  ),
                ),
              ]),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                child: const Text('Annuler'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Ajouter Tâche'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ])
          ]),
        ),
      ),
    );
  }
}
