final _base = "sounds";

final drinkWater = "$_base/water/drink_water.mp3";

// Hiit
final hiitStartVoices = List<String>.generate(4, (i) => "$_base/hiit/start/$i.mp3");
final hiitNumberVoices = List<String>.generate(10, (i) => "$_base/hiit/number/$i.mp3");
final hiitFinisheVoices = List<String>.generate(5, (i) => "$_base/hiit/finish/$i.mp3");
final hiitSaveSuccess = "$_base/hiit/finish/save_success.mp3";
final hiitSaveFailed = "$_base/hiit/finish/save_failed.mp3";
final hiitToWorkTime = "$_base/hiit/start/to_work_time.mp3";
final hiitToBreakTime = "$_base/hiit/start/to_break_time.mp3";

// Caterpillar
final caterpillarCountDownToStart = hiitToWorkTime;
final caterpillarSaveSuccess = hiitSaveSuccess;
final caterpillarSaveFailed = hiitSaveFailed;

// Sleep
final sleepWakeUpVoices = List<String>.generate(2, (i) => "$_base/sleep/wake_up/greet$i.mp3");
final sleepWakeUpSounds = List<String>.generate(4, (i) => "$_base/sleep/wake_up/$i.mp3");
final sleepGoToBedSound = "$_base/sleep/go_to_bed/go_to_bed.mp3";
