class Requests {
  static const _baseURL = 'http://localhost:3000';
  
  static const ping = "$_baseURL/ping";

  //sleep
  static const startSleep = "$_baseURL/sleeps/start";
  static const finishSleep = "$_baseURL/sleeps/finish";

  //caterpillar
  static const initCaterpillar = "$_baseURL/caterpillars";
  static const startCaterpillar = "$_baseURL/caterpillars/start";
  static const stopCaterpillar = "$_baseURL/caterpillars/stop";
  static const finishCaterpillar = "$_baseURL/caterpillars/finish";
}
