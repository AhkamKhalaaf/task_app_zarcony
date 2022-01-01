import 'package:flutter/cupertino.dart';

class TabControllerNotifier extends ChangeNotifier {
  int screenHomeTab = 0;

  screenHomeTabSwitch(int number) {
    screenHomeTab = number;
    notifyListeners();
    // print('${screenHomeTab.toString()}');
  }
}
