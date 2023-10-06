import 'package:fhir/r4.dart';

extension PatientUpdate on Patient {
  Patient updateFamilyName(String familyName) {
    final HumanName oldName = name?.first ?? const HumanName();
    final HumanName newName = oldName.copyWith(family: familyName);
    return copyWith(name: [newName]);
  }

  Patient updateGivenNames(String givenNames) {
    final HumanName oldName = name?.first ?? const HumanName();
    final HumanName newName = oldName.copyWith(given: givenNames.split(' '));
    return copyWith(name: [newName]);
  }

  Patient updateDob(DateTime newDob) {
    return copyWith(birthDate: FhirDate(newDob));
  }

  Patient updateSexAtBirth(String sexAtBirth) {
    return copyWith(gender: FhirCode(sexAtBirth));
  }

  Patient updateCountry(String country, [int index = 0]) {
    if (address == null || address!.isEmpty) {
      return copyWith(address: [Address(country: country)]);
    } else if (index >= address!.length) {
      return copyWith(address: [...address!, Address(country: country)]);
    } else {
      return copyWith(address: [
        ...address!.sublist(0, index),
        address![index].copyWith(country: country),
        ...address!.sublist(index + 1)
      ]);
    }
  }

  Patient updateState(String state, [int index = 0]) {
    if (address == null || address!.isEmpty) {
      return copyWith(address: [Address(state: state)]);
    } else if (index >= address!.length) {
      return copyWith(address: [...address!, Address(state: state)]);
    } else {
      return copyWith(address: [
        ...address!.sublist(0, index),
        address![index].copyWith(state: state),
        ...address!.sublist(index + 1)
      ]);
    }
  }

  Patient updateDistrict(String district, [int index = 0]) {
    if (address == null || address!.isEmpty) {
      return copyWith(address: [Address(district: district)]);
    } else if (index >= address!.length) {
      return copyWith(address: [...address!, Address(district: district)]);
    } else {
      return copyWith(address: [
        ...address!.sublist(0, index),
        address![index].copyWith(district: district),
        ...address!.sublist(index + 1)
      ]);
    }
  }

  Patient updateCity(String city, [int index = 0]) {
    if (address == null || address!.isEmpty) {
      return copyWith(address: [Address(city: city)]);
    } else if (index >= address!.length) {
      return copyWith(address: [...address!, Address(city: city)]);
    } else {
      return copyWith(address: [
        ...address!.sublist(0, index),
        address![index].copyWith(city: city),
        ...address!.sublist(index + 1)
      ]);
    }
  }

  Patient updateLine(List<String> line, [int index = 0]) {
    if (address == null || address!.isEmpty) {
      return copyWith(address: [Address(line: line)]);
    } else if (index >= address!.length) {
      return copyWith(address: [...address!, Address(line: line)]);
    } else {
      return copyWith(address: [
        ...address!.sublist(0, index),
        address![index].copyWith(line: line),
        ...address!.sublist(index + 1)
      ]);
    }
  }
}
