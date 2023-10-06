import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@Riverpod(keepAlive: true)
class Login extends _$Login {
  String username = '';
  String password = '';

  @override
  bool build() => false;

  void setValue(bool newValue) => state = newValue;

  void loggedIn() => state = true;

  void loggedOut() => state = false;

  void setUsername(String newUsername) => username = newUsername;

  void setPassword(String newPassword) => password = newPassword;

  void setUsernameAndPassword(String newUsername, String newPassword) {
    username = newUsername;
    password = newPassword;
  }

  void logout() {
    username = '';
    password = '';
    state = false;
  }
}
