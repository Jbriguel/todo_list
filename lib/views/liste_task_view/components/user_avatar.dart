import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  UserAvatar({super.key, required this.userName});

  String userName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(children: [
        Container(
          height: 45,
          width: 45,
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.deepPurple, width: 1.2),
          ),
          child: Image.asset(
            "ressources/images/user.png",
            fit: BoxFit.cover,
          ),
        ),
        Text(
          userName,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
        ),
      ]),
    );
  }
}
