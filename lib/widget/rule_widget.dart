import 'package:flutter/material.dart';
import 'package:tafl_app/model/rule.dart';
import 'package:google_fonts/google_fonts.dart';


const int kWidth = 1024;
const int kHeight = 1536;
const int kMarginTop = 250;
const int kMarginBottom = 400;
const int kMarginLR = 240;

class RuleWidget extends StatelessWidget {

  const RuleWidget({super.key, required this.rule});
  
  final Rule rule;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/end.png',
          fit: BoxFit.contain,
        ),
        // ✍️ Texte sur le parchemin
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraints) {

              final w = constraints.maxWidth;
              final h = constraints.maxHeight;
              //TODO depends of the orientation
              final double ratio = h/kHeight;
              
              return Padding(
                padding: EdgeInsets.only(
                  top: ratio * kMarginTop,
                  bottom: ratio * kMarginBottom,
                  left: ratio * kMarginLR,
                  right: ratio * kMarginLR,
                ),
                child: SizedBox(
                  height: h - ratio * kMarginTop - ratio * kMarginBottom,
                  width: w - ratio * kMarginLR -ratio * kMarginLR,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          rule.title,
                          style: GoogleFonts.newRocker(
                            fontSize: w * 0.07,
                            fontWeight: FontWeight.w300,
                            color: const Color.fromARGB(255, 88, 17, 3),
                          ),
                        ),
                        Divider(
                          color: const Color.fromARGB(255, 88, 17, 3),
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          rule.description,
                          style: GoogleFonts.newRocker(
                            fontSize: w * 0.055,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 88, 17, 3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}