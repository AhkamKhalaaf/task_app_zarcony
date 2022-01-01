import 'dart:ui';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class AppConfig
{
  final Color _colorMain = HexColor('#EE6A61');
  final Color _colorGrey = HexColor('#929294');
  final Color _colorBlack = HexColor('#707070');
  final Color _iconAddColor = HexColor('#47B6DA');
   Color get colorMain=>_colorMain;
  Color get colorText=>_colorGrey;
  Color get colorBlack=>_colorBlack;
  Color get iconAddColor=>_iconAddColor;
}
AppConfig appConfig=AppConfig();