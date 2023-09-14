import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mopenmrs/src.dart';

class DateInputField extends ConsumerWidget {
  const DateInputField(this.oldValue, this.hint, this.update, {super.key});

  final DateTime? oldValue;
  final String hint;
  final void Function(String) update;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController(
        text: oldValue?.toIso8601String().substring(0, 10));

    /// Basic field for editing and updating simple information like name
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(hint),
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: oldValue ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now());
          if (pickedDate != null) {
            controller.text = pickedDate.toIso8601String().substring(0, 10);
            ref.read(activePatientProvider.notifier).updateDob(pickedDate);
          }
        },
      ),
    );
  }
}
