import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/hiit/controller/hiit_controller.dart';
import 'package:routine_builder/feature/hiit/enum/train_statuses.dart';
import 'package:routine_builder/feature/hiit/widget/buttons.dart';
import 'package:routine_builder/general/model/hiit_setting.dart';
import 'package:routine_builder/general/model/hiit_train_data.dart';
import 'package:routine_builder/general/widget/gage.dart';

/*
  TODO: パフォーマンスを計測する
  30fpsくらいでゲージを動かしているが、重くないのか？
*/
class Train extends HookWidget {
  final HiitController hiitController;
  Train({required this.hiitController});

  @override
  Widget build(BuildContext context) {
    final trainController = hiitController.trainController;

    final subWidget = trainController.status == TrainStatuses.notStarted ||
            trainController.status == TrainStatuses.finished
        ? StartButton(hiitController.startTrain)
        : _Info(
            setting: hiitController.setting,
            currentRound: trainController.currentRound);

    final gageProgress = trainController.status == TrainStatuses.workTime
        ? trainController.currentWorkTimeMillis /
            (hiitController.setting.workTime * 1000)
        : trainController.status == TrainStatuses.breakTime
            ? 1 -
                trainController.currentBreakTimeMillis /
                    (hiitController.setting.breakTime * 1000)
            : 0.0;

    final gageColor = trainController.status == TrainStatuses.workTime
        ? Colors.green
        : trainController.status == TrainStatuses.breakTime
            ? Colors.blue
            : Colors.grey;

    final mainScreen = trainController.status == TrainStatuses.finished
        ? _Result(
            trainData: HiitTrainData(
              workTime: hiitController.setting.workTime,
              breakTime: hiitController.setting.breakTime,
              roundCount: trainController.currentRound,
            ),
            saveTrainSuccess: hiitController.saveTrainSuccess,
          )
        : Gage(gageProgress, color: gageColor);

    return Column(
      children: [
        mainScreen,
        SizedBox(
          height: 20,
        ),
        subWidget,
      ],
    );
  }
}

class _Info extends StatelessWidget {
  final HiitSetting setting;
  final int currentRound;
  _Info({required this.setting, required this.currentRound});

  @override
  Widget build(BuildContext context) {
    return Text("$currentRound/${setting.roundCount}",
        style: TextStyle(fontSize: 36));
  }
}

class _Result extends StatelessWidget {
  final HiitTrainData trainData;
  final bool saveTrainSuccess;
  _Result({required this.trainData, required this.saveTrainSuccess});

  @override
  Widget build(BuildContext context) {
    //TODO: トレーニング終了時に一瞬だけFailedになるのを修正する(通信環境次第)
    final message = saveTrainSuccess
        ? Text("Save Success!", style: TextStyle(color: Colors.green, fontSize: 24))
        : Text("Save Failed...", style: TextStyle(color: Colors.red, fontSize: 24));
    
    final textStyle = TextStyle(fontSize: 24);
    return Center(
        child: Container(
          width: 250,
          height: 300,
          child: Column(
          children: [
            Text("ワークタイム: ${trainData.workTime}", style: textStyle),
            Text("ブレークタイム: ${trainData.breakTime}", style: textStyle),
            Text("ラウンド数: ${trainData.roundCount}", style: textStyle),
            message,
          ],
        )
      )
    );
  }
}
