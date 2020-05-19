import 'package:flutter/foundation.dart';

class WorldDataContainer with ChangeNotifier{
  Map worldData;

  String selected="GLOB";
  Map countryCodes;
  int cardN=0;
    Map get getWorldData => worldData;
    String get getselected => selected;
    int get getcarnN => cardN;
    Map get getCodes => countryCodes;

    void updatecardN(cardval)
    {
      cardN=cardval;
      notifyListeners();
    }

  void updateCodes(dynamic x){
    if(x!=null){
    countryCodes=x;
    // notifyListeners();
    }
  }

  void updateSelected(String x)
  {
    selected=x;
    notifyListeners();
  }
  
  void updateWorldData(dynamic t)
  {
    if(t.length!=0)
    {
    debugPrint("world data = $t");
    worldData=t;
    // notifyListeners();
  }
  if(t==null)
  debugPrint("-----------------------------nulllllllllllllllllllllllllllllllllllllllllllln\n\n\n\n\n\n\n\n\n");
  }

}