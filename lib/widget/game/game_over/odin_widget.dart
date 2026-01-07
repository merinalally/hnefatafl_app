import 'package:flutter/material.dart';


class OdinWidget extends StatelessWidget {
  
  const OdinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Color.fromARGB(255, 244, 154, 118),
        BlendMode.modulate,
        //BlendMode.overlay,
      ),
      child:Image.asset(
        'assets/images/OdinML2.png',
        fit: BoxFit.cover,
      ),
    );
  }

}