import 'package:fhir/r4.dart';

extension AddressUpdate on Address {
  Address updateUse(AddressUse use) {
    return copyWith(use: use);
  }

  Address updateType(AddressType type) {
    return copyWith(type: type);
  }

  Address updateText(String text) {
    return copyWith(text: text);
  }

  Address updateLine(List<String> line) {
    return copyWith(line: line);
  }

  Address updateCity(String city) {
    return copyWith(city: city);
  }

  Address updateDistrict(String district) {
    return copyWith(district: district);
  }

  Address updateState(String state) {
    return copyWith(state: state);
  }

  Address updatePostalCode(String postalCode) {
    return copyWith(postalCode: postalCode);
  }

  Address updateCountry(String country) {
    return copyWith(country: country);
  }

  Address updatePeriod(Period period) {
    return copyWith(period: period);
  }
}
