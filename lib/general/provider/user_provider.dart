import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:routine_builder/general/class/user.dart";
import "package:routine_builder/general/enum/statuses.dart";

part 'user_provider.g.dart';

@riverpod
UserProviderReturn user(UserRef ref) {
  void updateStatus(Statuses newStatus) {
    ref.read(userProvider).user.status.value = newStatus;
  }

  return UserProviderReturn(
    user: User(
      name: "Panda",
      status: Statuses.sleeping,
    ),
    updateStatus: updateStatus,
  );
}

class UserProviderReturn {
  final User user;
  final void Function(Statuses) updateStatus;

  UserProviderReturn({
    required this.user,
    required this.updateStatus,
  });
}
