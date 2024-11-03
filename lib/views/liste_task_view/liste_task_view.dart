import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/views/liste_task_view/components/add_user_avatar.dart';
import 'package:todo_list/views/liste_task_view/components/contents/add_collaborateur_content.dart';
import 'package:todo_list/views/liste_task_view/components/contents/add_new_list_content.dart';
import 'package:todo_list/views/liste_task_view/components/contents/add_task_content.dart';
import 'package:todo_list/views/liste_task_view/components/contents/rename_list_content.dart';
import 'package:todo_list/views/liste_task_view/components/task_item.dart';

import 'components/user_avatar.dart';

class ListeTaskView extends StatefulWidget {
  ListeTaskView({super.key, required this.addMode});
  bool addMode;

  @override
  State<ListeTaskView> createState() => _ListeTaskViewState();
}

class _ListeTaskViewState extends State<ListeTaskView> {
  ///Controllers
  TextEditingController _searchController = TextEditingController();
  TextEditingController _titreController = TextEditingController();
  TextEditingController _descirptionController = TextEditingController();

  Future<dynamic> showAddNewList_PopUp() async {
    if (widget.addMode == true) {
      return showDialog<dynamic>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return addNewListContent(
              titreController: _titreController,
              descirptionController: _descirptionController);
        },
      );
    }
  }

  Future<dynamic> showAddNewCollaborator_PopUp() async {
    TextEditingController _collaboratorEmailController =
        TextEditingController();
    return showDialog<dynamic>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return addCollaborateurContent(
            collaboratorEmailController: _collaboratorEmailController);
      },
    );
  }

  ///Add Task
  Future<dynamic> showAddTask_PopUp() async {
    return showDialog<dynamic>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return addTaskContent();
      },
    );
  }

  Future<dynamic> showRenameList_PopUp() async {
    TextEditingController _listNameController = TextEditingController();
    return showDialog<dynamic>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return renameListContent(listNameController: _listNameController);
      },
    );
  }

  Future<dynamic> showDeleteList_PopUp() async {
    return showDialog<dynamic>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
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
                    'Suppression de la liste',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Voulez-vous vraiment supprimer cette liste ?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                    child: const Text('Annuler'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Mettre à jour'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ])
              ]),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showAddNewList_PopUp().then((value) {
        if (value == false) {
          Navigator.of(context).pop();
        } else if (value == true) {
          //Effectuer l'enregistrement
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () => showAddNewCollaborator_PopUp(),
              icon: const Icon(CupertinoIcons.person_add)),
          _selectedOptions(),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Collaborateurs',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
        ),
        Container(
          height: 75,
          margin: const EdgeInsets.all(5.0),
          child: Row(children: [
            GestureDetector(
                onTap: () => showAddNewCollaborator_PopUp(),
                child: const AddUserAvatar()),
            ...["Joe Dy", "Karim DI", "Aziz AB"].map((name) => UserAvatar(
                  userName: name,
                ))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Nom de la liste de tâches',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
        ),
        taskItem(isCompleted: false),
        taskItem(isCompleted: true),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddTask_PopUp(),
        tooltip: 'Ajouter tâche',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _selectedOptions() => Padding(
        padding: const EdgeInsets.only(left: 2, right: 5),
        child: PopupMenuButton<int>(
          icon: Icon(
            Icons.more_vert,
            color: Colors.grey.shade800,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
                value: 1, child: _actionList(Icons.edit, "Rennommer Liste")),
            PopupMenuItem(
                value: 2, child: _actionList(Icons.add, "Nouvelle tâche")),
            PopupMenuItem(
                value: 3,
                child: _actionList(Icons.delete_sweep, "Supprimer la liste")),
          ],
          offset: const Offset(40, 0),
          surfaceTintColor: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          position: PopupMenuPosition.under,
          color: Colors.white,
          elevation: 2,
          onSelected: (value) {
            // Vous pouvez ajouter une action ici pour le `onSelected` si nécessaire.
            if (value == 1) {
              showRenameList_PopUp();
            }
            if (value == 2) {
              showAddTask_PopUp();
            }
            if (value == 3) {
              showDeleteList_PopUp();
            }
          },
        ),
      );

// Widget personnalisé pour les actions
  Widget _actionList(IconData icon, String text,
      {Color color = Colors.black87}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: <Widget>[
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          maxLines: 2,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 15,
            color: color,
          ),
        ),
      ]),
    );
  }
}
