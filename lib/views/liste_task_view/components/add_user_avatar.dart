import 'package:flutter/material.dart';

class AddUserAvatar extends StatelessWidget {
  const AddUserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 45,
        width: 45,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border:
              Border.all(color: Colors.deepPurple.withOpacity(0.8), width: 1.2),
        ),
        child: Image.asset(
          "ressources/images/user.png",
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        bottom: 0,
        right: 30,
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 15,
          ),
        ),
      ),
    ]);
  }
}
