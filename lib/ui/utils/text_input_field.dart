import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TextInputField extends ConsumerWidget {
  const TextInputField(this.oldValue, this.hint, this.update, {super.key});

  final String oldValue;
  final String hint;
  final void Function(String) update;

  @override
  Widget build(BuildContext context, WidgetRef ref) =>

      /// Basic field for editing and updating simple information like name
      SizedBox(
        height: 40,
        child: TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(
              hint,
            ),
          ),
          initialValue: oldValue,
          onChanged: (String newValue) {
            update(newValue);
          },
        ),
      );
}
