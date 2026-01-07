import 'package:flutter/material.dart';

class TitleAppWidget extends StatelessWidget
{
  const TitleAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints)
      {
        double width = constraints.maxWidth;
        return Stack(
          alignment: Alignment.center,
          children: 
          [
            Image.asset(
            'assets/images/title.png',
            color:Color.fromARGB(205, 228, 152, 82),
            width: width,
            ),
            Positioned.fill(
              child:Center(
                child: Image.asset(
                'assets/images/title.png',
                color:Color.fromARGB(255, 88, 17, 3,),
                width: 0.98*width,
                ),
              ),
            )
          ],
        );
      },
    );
  }


}