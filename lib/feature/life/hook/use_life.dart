import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/life/controller/life_controller.dart';
import 'package:routine_builder/general/model/life.dart';
import 'package:routine_builder/general/query/client/life_query_client.dart';

LifeController useLife() {
  final _life = useState<Life>(Life.init());
  final _client = LifeQueryClient();

  useEffect(() {
    _client.today().then((res) {
      _life.value = res.life;
    }).catchError((err) {
      print("$err from useLife hook");
    });
  }, []);

  return useMemoized(() {
    return LifeController(life: _life.value);
  }, [_life.value]);
}
