import 'package:at_client_mobile/at_client_mobile.dart';

abstract class AppUser {
  const AppUser();
}

class AtSignUser extends AppUser {
  const AtSignUser({required this.atClient});

  final AtClient atClient;
}

class FakeAppUser extends AppUser {
  const FakeAppUser({required this.uid, this.email, this.password});

  final String uid;
  final String? email;
  final String? password;
}
