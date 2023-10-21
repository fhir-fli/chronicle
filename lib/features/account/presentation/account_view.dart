import 'package:flutter/material.dart';
import 'package:vida/src.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.account),
        actions: const [LogoutIconButton()],
      ),
    );
  }
}
