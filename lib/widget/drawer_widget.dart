import 'package:flutter/material.dart';
import 'package:tafl_app/widget/drawer_list_tile.dart';


class GameDrawer extends StatelessWidget {
  const GameDrawer({
    super.key,
    required this.goToMenu,
  });

  final void Function() goToMenu;

  @override
  Widget build(BuildContext context) {

    Widget title = Stack(
      alignment: Alignment.center,
      children: 
      [
        Image.asset(
        'assets/images/title.png',
        color:Color.fromARGB(205, 228, 152, 82),
        height: 150,
        ),
        Positioned.fill(
          child:Center(
            child: Image.asset(
            'assets/images/title.png',
            color:Color.fromARGB(255, 185, 182, 181),
            height: 148,
            ),
          ),
        )
      
      ],
    );


    return Drawer(
      //width: 250,
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
            color: Colors.black.withValues(alpha: 0.6),
          ),

          // Content
          Column(
            children: [
              DrawerHeader(
                //padding: const EdgeInsets.only(left: 0, top: 60),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 88, 17, 3),//.withValues(alpha: 0.9),
                ),
                child: Center(child: title),
              ),
              DrawerListTile(
                text: 'Recommencer la partie',
                onClick: ()=>Navigator.of(context).pop(),
              ),
              DrawerListTile(
                text: 'Retour au menu',
                onClick: goToMenu,
              ),
              DrawerListTile(
                text: 'Quitter',
                onClick: ()=>Navigator.of(context).pop(),
              ),
            ],
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