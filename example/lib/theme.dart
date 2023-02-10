import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle gfont = GoogleFonts.nunitoSans(fontSize: 15.5, color: Colors.black87);

class Gfont {
  static final white = gfont.copyWith(color: Colors.white);

  // size
  static final fs12 = gfont.copyWith(fontSize: 12);
  static final fs13 = gfont.copyWith(fontSize: 13);
  static final fs14 = gfont.copyWith(fontSize: 14);
  static final fs15 = gfont.copyWith(fontSize: 15);
  static final fs16 = gfont.copyWith(fontSize: 16);
  static final fs17 = gfont.copyWith(fontSize: 17);
  static final fs18 = gfont.copyWith(fontSize: 18);
  static final fs19 = gfont.copyWith(fontSize: 19);
  static final fs20 = gfont.copyWith(fontSize: 20);

  static TextStyle bold = gfont.copyWith(fontWeight: FontWeight.bold);
  static TextStyle normal = gfont.copyWith(fontWeight: FontWeight.normal);
  static TextStyle muted = gfont.copyWith(fontWeight: FontWeight.normal, color: Colors.black54);

  static boldWith([Color color = Colors.black87, double size = 15.5]) => gfont.copyWith(fontWeight: FontWeight.bold, color: color, fontSize: size);
  static TextStyle fs(double size) => gfont.copyWith(fontSize: size);
  static TextStyle color(Color color) => gfont.copyWith(color: color);
}

extension GfontExt on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);
  TextStyle get muted => copyWith(fontWeight: FontWeight.normal, color: Colors.black54);
  TextStyle get white => copyWith(color: Colors.white);

  TextStyle fsize(double size) => copyWith(fontSize: size);
  TextStyle fcolor(Color color) => copyWith(color: color);
  TextStyle fopacity(double opacity) => copyWith(color: color?.withOpacity(opacity));
}
