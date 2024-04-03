import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/hiit/controller/hiit_controller.dart';
import 'package:routine_builder/feature/hiit/hook/use_setting_form.dart';
import "package:routine_builder/feature/hiit/widget/buttons.dart";
import 'package:routine_builder/general/class/hiit_setting.dart';

class Setting extends HookWidget {
  final HiitController hiitController;
  Setting({required this.hiitController});

  @override
  Widget build(BuildContext context) {
    final settingController = useSettingForm(hiitController.setting);

    void handleSave() {
      hiitController.saveSetting(HiitSetting(
        workTime: settingController.workTime,
        breakTime: settingController.breakTime,
        roundCount: settingController.roundCount,
      ));
    }

    return Center(
      child: Container(
          width: 200,
          height: 320,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("設定", style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Container(
                height: 200,
                color: Colors.blue[300],
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    _SettingItem(
                        title: "ワークタイム",
                        value: settingController.workTime,
                        options: settingController.workTimeOptions,
                        unit: "秒",
                        onChanged: (value) {
                          settingController.setWorkTime(value!);
                        }),
                    _SettingItem(
                        title: "ブレークタイム",
                        value: settingController.breakTime,
                        options: settingController.breakTimeOptions,
                        unit: "秒",
                        onChanged: (value) {
                          settingController.setBreakTime(value!);
                        }),
                    _SettingItem(
                        title: "ラウンド数",
                        value: settingController.roundCount,
                        options: settingController.roundCountOptions,
                        unit: "回",
                        onChanged: (value) {
                          settingController.setRoundCount(value!);
                        }),
                  ],
                ),
              ),
              SettingSaveButton(handleSave),
            ],
          )),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final String title;
  final int value;
  final List<int> options;
  final String unit;
  final Function(int?)? onChanged;
  _SettingItem({
    required this.title,
    required this.value,
    required this.options,
    this.unit = "",
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _DropdownButton(
                value: value, options: options, onChanged: onChanged),
            Text(unit),
          ],
        ),
      ],
    );
  }
}

class _DropdownButton extends StatelessWidget {
  final int value;
  final List<int> options;
  final Function(int?)? onChanged;
  _DropdownButton({required this.value, required this.options, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final items = options
        .map((option) =>
            DropdownMenuItem(child: Text(option.toString()), value: option))
        .toList();
    return DropdownButton(
      menuMaxHeight: 200,
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}
