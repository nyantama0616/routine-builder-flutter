import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_builder/general/class/user.dart';
import 'package:routine_builder/general/enum/statuses.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(User(name: 'Panda', status: Statuses.none));
});

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.user);

  void updateStatus(Statuses newStatus) {
    state = User(name: state.name, status: newStatus);
  }
}
