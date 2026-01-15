import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/provider/game_rules_provider.dart';
import 'package:tafl_app/model/rule.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/widget/core/drawer/drawer_icon_widget.dart';
import 'package:tafl_app/widget/core/drawer/drawer_widget.dart';
import 'package:tafl_app/widget/core/screen_widget.dart';
import 'package:tafl_app/widget/rules/menu_bottom_navigation_bar.dart';
import 'package:tafl_app/widget/rules/rule_widget.dart';


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
      drawer: GameDrawer.settings(
        goToMenu: ()=>ref.read(screenProvider.notifier).goToMenu(),
      ),
      body: ScreenWidget.forest(
        content: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(
                builder: (context) => IconButton(
                  icon: DrawerIconWidget(),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
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

