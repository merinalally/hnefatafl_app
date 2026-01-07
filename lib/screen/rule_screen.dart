import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/provider/game_rules_provider.dart';
import 'package:tafl_app/model/rule.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/widget/option_button.dart';
import 'package:tafl_app/widget/screen_widget.dart';
import 'package:tafl_app/widget/menu_bottom_navigation_bar.dart';
import 'package:tafl_app/widget/rule_widget.dart';


/*
const int kWidth = 694;
const int kHeight = 1114;
const int kMarginTop = 135;
const int kMarginBottom = 145;
const int kMarginLR = 80;
*/



class RuleScreen extends ConsumerStatefulWidget {
  
  const RuleScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() { 
    return RuleScreenState();
  }
}

class RuleScreenState extends ConsumerState<RuleScreen>
{
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = 0;
  }

  void _next(){
    List<Rule> rules = ref.read<List<Rule>>(gameRulesProvider);
    if (index < rules.length - 1)
      {
        setState(() {
              index += 1;
        });
      }
  }

  void _previous(){
    if (index > 0)
      {
        setState(() {
              index -= 1;
        });
      }
  }

  @override
  Widget build(BuildContext context) {

    List<Rule> rules = ref.read<List<Rule>>(gameRulesProvider);

    return Scaffold(
      body: ScreenWidget.forest(
        content: SafeArea(
          child: Column(
            children: [
              OptionButton.small(
                text: 'Quit', 
                onPressed: (){
                  ref.read(screenProvider.notifier).goToMenu();
                },
              ),
              RuleWidget(
                rule: rules[index],
                index: '${index + 1}/${rules.length}',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: MenuBottomNavigationBar(
            key: ValueKey(index),
            next: _next,
            previous: _previous,
          ),
      ),
    );
  }

}

