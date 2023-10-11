import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src.dart';

class StyledOvalTextFormField extends ConsumerWidget {
  const StyledOvalTextFormField({
    this.prefixIcon,
    this.label,
    this.controller,
    this.percentWidth = 1.3,
    this.breakPoint = 400,
    this.obscureText = false,
    super.key,
  });

  final Widget? prefixIcon;
  final String? label;
  final TextEditingController? controller;
  final double percentWidth;
  final double breakPoint;
  final bool obscureText;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, 5),
              blurRadius: 10.0,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        child: SizedBox(
          width: doubleByPercentWidth(context, 1.3) > breakPoint
              ? breakPoint
              : doubleByPercentWidth(context, 1.3),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              border: InputBorder.none,
              label: label == null ? null : Text(label!),
              prefixIcon: prefixIcon,
            ),
          ),
        ),
      );
}
