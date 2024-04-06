class SettingFormController {
  final int workTime;
  final int breakTime;
  final int roundCount;

  Function(int) setWorkTime;
  Function(int) setBreakTime;
  Function(int) setRoundCount;

  final List<int> workTimeOptions;
  final List<int> breakTimeOptions;
  final List<int> roundCountOptions;

  SettingFormController({
    required this.workTime,
    required this.breakTime,
    required this.roundCount,
    required this.setWorkTime,
    required this.setBreakTime,
    required this.setRoundCount,
    required this.workTimeOptions,
    required this.breakTimeOptions,
    required this.roundCountOptions,
  });
}
