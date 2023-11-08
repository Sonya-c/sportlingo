import 'package:flutter/widgets.dart';

const Color purple = Color(0xFF9C2C77);
const Color magenta = Color(0xFFC70039);
const Color magentaDark = Color(0xFF8B0027); //#8b0027
const Color orange = Color(0xFFFC4F00);
const Color amber = Color(0xFFFFA41B);

const LinearGradient amberOrangeGradient = LinearGradient(
  colors: [amber, orange],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const LinearGradient orangeMagentaGradient = LinearGradient(
  colors: [orange, magenta],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const LinearGradient magentaPurpleGradient = LinearGradient(
  colors: [magenta, purple],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
