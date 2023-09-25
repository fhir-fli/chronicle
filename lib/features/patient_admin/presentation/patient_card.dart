import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../src.dart';

class PatientCard extends StatelessWidget {
  const PatientCard(this.patient, this.onPressed, {super.key});

  final Patient patient;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(5),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shadowColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))))),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${context.loc.names}: ',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  fullNameFromHumanNameList(names: patient.name),
                  style: const TextStyle(color: Colors.black),
                ),
                const Gap(4),
                Row(
                  children: [
                    Text(
                      '${context.loc.birthDateAbbreviation}: ',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      patient.birthDate.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const Gap(4),
                Row(
                  children: [
                    Text(
                      '${context.loc.sexAtBirth}: ',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      patient.gender.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const Gap(4),
              ]),
        ),
      ),
    );
  }
}
