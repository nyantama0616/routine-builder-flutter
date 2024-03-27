final _base = "sounds";

final drinkWater = "$_base/water/drink_water.mp3";

final hiitStartVoices = List<String>.generate(4, (i) => "$_base/hiit/start/$i.mp3");
final hiitNumberVoices = List<String>.generate(10, (i) => "$_base/hiit/number/$i.mp3");
final hiitFinisheVoices = List<String>.generate(5, (i) => "$_base/hiit/finish/$i.mp3");
final hiitSaveSuccess = "$_base/hiit/finish/save_success.mp3";
final hiitSaveFailed = "$_base/hiit/finish/save_failed.mp3";
final hiitCountDown = "$_base/hiit/start/count_down.mp3";
