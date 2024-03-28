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

//water
final initWater = "$_baseURL/waters";
final drinkWater = "$_baseURL/waters/drink";

//hiit
final initHiit = "$_baseURL/hiits";
final createHiit = "$_baseURL/hiits";
final updateHiitSetting = "$_baseURL/hiits/setting";
