import 'package:flutter/material.dart';
import 'package:tafl_app/widget/drawer_list_tile.dart';
import 'package:tafl_app/widget/option_button.dart';
import 'package:tafl_app/widget/title_app_widget.dart';


class GameDrawer extends StatelessWidget {
  const GameDrawer({
    super.key,
    required this.goToMenu,
  });

  final void Function() goToMenu;

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/game.png',
            fit: BoxFit.cover,
          ),

          // Optional overlay (pour lisibilité)
          Container(
            color: Colors.black.withValues(alpha: 0.4),
          ),

          // Content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 3,
              children: [
                TitleAppWidget(),
                const SizedBox(
                  height: 5,
                ),
                OptionButton.normal(text: 'Recommencer', onPressed: (){}),
                OptionButton.normal(text: 'Retour au Menu', onPressed: goToMenu),
                OptionButton.normal(text: 'Quitter', onPressed: (){
                  Navigator.of(context).pop();
                }),
              ],
            ),
          ),
        ],
      ),
    );
         
  }
}



/*
class GameDrawer extends StatelessWidget
{
  const GameDrawer({super.key});

  @override
  Widget build(BuildContext context) {
       return Drawer(
        width: 250,
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.only(left: 0, top: 60),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 88, 17, 3),
            ),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.bottom,
              leading: Image.asset(
                'assets/images/weapons.png',
                height: 40,
                color: const Color.fromARGB(255, 196, 196, 196),
              ),
              title : Text(
                'Hfnefatafl',
                style : GoogleFonts.newRocker(
                  fontSize: 25,
                  fontWeight: FontWeight.w100,
                  color: const Color.fromARGB(255, 196, 196, 196),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/weapons.png',
              height: 20,
              color:const Color.fromARGB(255, 88, 17, 3),
            ),
            title: Text('Recommencer la partie',
              style : GoogleFonts.newRocker(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color:const Color.fromARGB(255, 88, 17, 3),
              ),
            ),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

}

*/