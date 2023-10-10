import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vida/src.dart';

class AccountView extends ConsumerWidget{
  const AccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(accountViewControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text()),
    )
  }
}