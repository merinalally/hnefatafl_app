import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/model/rule.dart';
import 'package:tafl_app/data/rules.dart';

final gameRulesProvider = Provider<List<Rule>>((ref) {
  return rules;
});