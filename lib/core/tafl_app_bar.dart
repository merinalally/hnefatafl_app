import 'package:flutter/material.dart';

class TaflAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaflAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Hnefatafl',  
        style: TextStyle(
          color:   const Color.fromARGB(255, 251, 248, 248),
          fontWeight: FontWeight.w400,
          fontSize: 24,),
        textAlign: TextAlign.center,
      ),
      backgroundColor:const Color.fromARGB(255, 88, 17, 3),
      actions: [  
        IconButton(
          icon: const Icon(Icons.import_contacts, color: Colors.white,),
          onPressed: () {
            // Implement reset functionality if needed
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}