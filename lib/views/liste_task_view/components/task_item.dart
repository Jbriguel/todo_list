import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class taskItem extends StatelessWidget {
  taskItem({
    super.key,
    required this.isCompleted,
  });
  bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0.5,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey.shade100),
          padding: const EdgeInsets.all(2.0),
          child: Icon(
            isCompleted ? Icons.circle : Icons.circle_outlined,
            color: Colors.deepPurple.withOpacity(0.8),
            size: 28.0,
          ),
        ),
        title: Text(
          "Titre de la tâche",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                decoration: isCompleted ? TextDecoration.lineThrough : null,
              ),
        ),
        subtitle: Text(
          "22/02/2022 - 12:00",
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.star_border_purple500_outlined,
            color: Colors.grey.withOpacity(0.8),
            size: 24.0,
          ),
        ),
      ),
    );
  }
}
