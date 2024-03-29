const HANON_NUM = 20;
const HANON_PATTERN_NUM = 22;
final SCALES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"].map((name) => ["m", "M"].map((type) => "$name$type").toList()).expand((element) => element).toList();
const TRAIN_SECONDS = 30 * 60; //1回の練習時間(秒)
const PATTERN_GOAL_MINUTES = 120; //各パターンの目標練習時間(分)
