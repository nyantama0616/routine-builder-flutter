import 'package:flutter_dotenv/flutter_dotenv.dart';

final String _baseURL = dotenv.env['API_URL']!;

final ping = "$_baseURL/dev/ping";

//home
final initHome = "$_baseURL/home";

//sleep
final startSleep = "$_baseURL/sleeps/start";
final finishSleep = "$_baseURL/sleeps/finish";

//caterpillar
final initCaterpillar = "$_baseURL/caterpillars";
final startCaterpillar = "$_baseURL/caterpillars/start";
final stopCaterpillar = "$_baseURL/caterpillars/stop";
final finishCaterpillar = "$_baseURL/caterpillars/finish";

//hanon
final initHanon = "$_baseURL/hanons";
final startHanon = "$_baseURL/hanons/start";
final stopHanon = "$_baseURL/hanons/stop";
final finishHanon = "$_baseURL/hanons/finish";

//water
final initWater = "$_baseURL/waters";
final drinkWater = "$_baseURL/waters/drink";

//hiit
final initHiit = "$_baseURL/hiits";
final createHiit = "$_baseURL/hiits";
final updateHiitSetting = "$_baseURL/hiits/setting";

//tooth
final initTooth = "$_baseURL/tooths";
final startTooth = "$_baseURL/tooths/start";
final stopTooth = "$_baseURL/tooths/stop";
final finishTooth = "$_baseURL/tooths/finish";

//foodCost
final initFood = "$_baseURL/foods";
final createFood = "$_baseURL/foods";
final updateFood = (int id) => "$_baseURL/foods/$id";
