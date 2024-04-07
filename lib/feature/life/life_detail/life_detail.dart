import 'package:flutter/material.dart';
import 'package:routine_builder/feature/life/enum/daysOfWeek.dart';
import 'package:routine_builder/feature/life/life_detail/helper.dart';
import 'package:routine_builder/general/model/life.dart';

class LifeDetail extends StatelessWidget {
  final Life life;
  final double width;
  final double height;

  LifeDetail(this.life, {this.width = 300, this.height = 600});

  @override
  Widget build(BuildContext context) {
    

    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          Text(date(life), style: TextStyle(fontSize: 20)),
          LifeParamList(life),
        ],
      ),
    );
  }
}

class LifeParamList extends StatelessWidget {
  final Life life;
  final double width;
  final double height;

  LifeParamList(this.life, {this.width = 200, this.height = 550});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: ListView(children: [
          LifeParamListItem("起床時刻", wakedUpAt(life)),
          Divider(),
          LifeParamListItem("就寝時刻", wentToBedAt(life)),
          Divider(),
          LifeParamListItem("睡眠時間", sleepTime(life)),
          Divider(),
          LifeParamListItem("水分量", water(life)),
          Divider(),
          LifeParamListItem("HIIT", hiit(life)),
          Divider(),
          LifeParamListItem("ハノン", hanon(life)),
          Divider(),
          LifeParamListItem("いもむし", caterpillar(life)),
        ]));
  }
}

class LifeParamListItem extends StatelessWidget {
  final String title;
  final String value;

  LifeParamListItem(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(value),
    );
  }
}
