import 'package:tafl_app/model/rule.dart';

final kPresentationRule = Rule(
  title: 'Présentation', 
  description: "Le Hnefatafl est un jeu de stratégie asymétrique :\n Un camp attaque\n L’autre défend le roi\n",
);

final kGoalRule = Rule(
  title: 'But du jeu',
  description: "Le but n’est pas d’éliminer l’adversaire, mais :\n - pour les défenseurs : faire fuir le roi\n - pour les attaquants : capturer le roi",
);

final kBoardRule = Rule(
  title: 'Plateau et Pièces', 
  description: "Le plus courant : 11 × 11 cases\n Certaines cases sont spéciales :\n - le trône (au centre)\n - les 4 coins (cases d’évasion)",
);

final kPiecesRule = Rule(
  title: 'Plateau et Pièces', 
  description: "- 1 Roi (au centre)\n - Défenseurs (autour du roi)\n - Attaquants (sur les bords du plateau)\nLes attaquants sont plus nombreux.",
);

final kPlayRule = Rule(
  title: 'Déroulement du jeu', 
  description: "Les joueurs jouent à tour de rôle\n Les attaquants commencent",
);

final kMoveRule = Rule(
  title: 'Déplacement', 
  description: "Toutes les pièces se déplacent en ligne droite, horizontalement ou verticalement sans sauter d’autres pièces\n Comme une tour aux échecs",
);

final kCaptureRule = Rule(
  title: 'Capture classique', 
  description: "Une pièce est capturée si elle est prise en sandwich entre deux pièces ennemies sur une ligne droite (horizontalement ou verticalement)\n La pièce capturée est retirée du plateau.\n La capture doit être active.",
);

final kKingCaptureRule = Rule(
  title: 'Capture du roi', 
  description: "Le roi est plus difficile à capturer.\n Selon la variante la plus répandue\n Le roi doit être encerclé sur ses 4 côtés\n Le trône peut compter comme un côté hostile s’il est vide\n Le roi ne capture pas comme une pièce normale dans certaines variantes (à vérifier selon la règle choisie).\n",
);

final kVictoryRule = Rule(
  title: 'Victoire', 
  description: "Le roi atteint l’une des 4 cases de coin :\n Victoire des défenseurs\n\n Le roi est capturé :\n Victoire des attaquants \n",
);

final List<Rule> rules = [
  kPresentationRule,
  kGoalRule,
  kBoardRule,
  kPiecesRule,
  kPlayRule,
  kMoveRule,
  kCaptureRule,
  kKingCaptureRule,
  kVictoryRule
];