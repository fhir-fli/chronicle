import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownInputField extends ConsumerWidget {
  const DropdownInputField({
    this.oldValue,
    required this.hint,
    this.valueSet,
    this.items,
    required this.update,
    super.key,
  });

  final String? oldValue;
  final String hint;
  final ValueSet? valueSet;
  final List<String>? items;
  final void Function(String) update;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Basic field for editing and updating simple information like name
    return SizedBox(
      height: 40,
      child: DropdownMenu<String>(
        hintText: hint,
        helperText: hint,
        initialSelection: oldValue,
        // icon: const Icon(Icons.arrow_downward),
        // decoration: InputDecoration(
        //   border: const OutlineInputBorder(),
        //   label: Text(hint),
        // ),
        onSelected: (String? s) {
          if (s != null) {
            update(s);
          }
        },
        dropdownMenuEntries: (items ?? [])
            .map<DropdownMenuEntry<String>>(
                (String value) => DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    ))
            .toList(),
      ),
    );
  }
}
