import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/dev/ping/use_ping.dart';
import 'package:routine_builder/general/query/query_statuses.dart';

class Ping extends HookWidget {
  const Ping({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = usePing();
    final authorized = controller.authorized ? "Authorized" : "Unauthorized";
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Push and recieve a message from server!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: "IndieFlower",
              color: Colors.blue,
            ),
          ),
          if (controller.status == QueryStatuses.doing)
            const CircularProgressIndicator()
          else
            Text(
              controller.message,
              style: const TextStyle(
                fontSize: 40,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: "IndieFlower",
              ),
            ),
            Text(authorized, style: const TextStyle(fontSize: 20)),
          ElevatedButton(
            onPressed: controller.submit,
            child: const Text("Ping"),
          ),
          ElevatedButton(
            onPressed: controller.reset,
            child: const Text("Reset"),
          ),
        ],
      ),
    );
  }
}
