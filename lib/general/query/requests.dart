class Requests {
  static const _baseURL = 'http://localhost:3000';
  
  static const ping = "$_baseURL/ping";

  //sleep
  static const startSleep = "$_baseURL/sleeps/start";
  static const finishSleep = "$_baseURL/sleeps/finish";
}
