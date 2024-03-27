import 'package:routine_builder/general/class/hiit_setting.dart';

class UpdateSettingRequestBody {
  final HiitSetting hiitSetting;

  UpdateSettingRequestBody({required this.hiitSetting});

  Map<String, dynamic> toJson() {
    return {
      "hiitSetting": hiitSetting.toJson(),
    };
  }

  factory UpdateSettingRequestBody.fromJson(Map<String, dynamic> json) {
    return UpdateSettingRequestBody(
      hiitSetting: HiitSetting.fromJson(json['hiitSetting']),
    );
  }
}
