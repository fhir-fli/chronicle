import 'dart:io';

import 'package:translations/translate.dart';

Future<void> main() async {
  await translate(
    translationCredentials: translationCredentials,
    translationSheetId: translationSheetId,
  );

  final Directory inputDirectory = Directory('lib/l10n');
  final Directory outputDirectory = Directory('../lib/l10n');
  for (final file in inputDirectory.listSync()) {
    if (file is File) {
      final String fileName = file.path.split('/').last;
      final File outputFile = File('${outputDirectory.path}/$fileName');
      outputFile.writeAsStringSync(file.readAsStringSync());
    }
  }
}

const translationCredentials = {
  "type": "service_account",
  "project_id": "fhirfli-401119",
  "private_key_id": "8a29ecc8168de43b3616c547e7b8bed51ee150c7",
  "private_key":
      "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCunCmiMUHyUhWT\n5wO1JlgMmaypqqA3XoCOG2dYgA1ueDddiwYKseZrhQKZl++Mjr99aczEcpgoEkI4\nPsdqvRootQUdZ1/JF8UAgpXRWCAgziAQZxHiN8Me5IZMw1/G/FQer2KLg0Xstb0q\nlCTpjsZ+HKaBmWEiMAtPDuAL8EHo0NPipihnNKuPT7s/Rj6Zj4eVz0mbnPrySU0L\nMkB3wN0NsWSTc0hVnrBB1kUsfWXClZiyLmLhCizEtKwLifT90yOKauvaDcQf5Hqa\n7ezDQzdJ2NVSmGJ1XSbH/t2gFumkoWx8njCSNmCmyEBWmCPjVq6BhHFBSJO8VpF1\nqbic9jyvAgMBAAECggEAVHWkK9igugpbdp3NbM/d0kZ5Pt6SPgYfr91wiV3zYUaU\nHVLUetLfjo2Zmtrj2/zmgk7tZe66S9O9JUC0rBxJbXxWO4lXy0kMmTkRJ+B1NfkO\niHCatW5cmvJWRgZRK0q9k9QpGivG5H9qP5DGJBVUTQclwVWEJwnPRo/+7rdp4ido\nYvj01Lgrh6TKYrKyj3ah0kznypPDifp/lGODIWH9sIh+rRE+3AfpKwhO9izhQX7q\nAqIvl7Uq99OeyBfkRL7ueg4aOs/7mbaea4vKcSg5y0PEkMmXdlI64o9x/7Wx61t9\nPn12xXiOugXN9rPm7gPjDfXwT45Vafbv78RGrO+/bQKBgQDZDSkUig2UDLnaoxFU\ni8hAW1aJzXweFnTqwQWRu8b7pjGSJqZLWoLI6iJ+1LCttWKlk1U4GqhqjlTN060r\nEBc01WElKGTwrk2zvJ7LSzh8YoGJRiS9/4kkJf2Qfj9bpYNSgJFSUyV1PyMWnDln\ncUy6sfJC8tro6LhK19/aNp9kWwKBgQDN8VewcaeShNT4v4llF5ObvWthHn8BxjcM\nAdELc22ZVWRxrdR6mS+0EjhaBnrXV2Zvff5EvimxRyejCuuiAHnWBz8544leQ/Kz\nOizbqfvnWgzUVvzzFK94fEwqXp4F70cvac3Hkx4+H1YOASVC2RnXLRDt0qgkkEoP\neHk+GxZpPQKBgCKgNdh/+ZCPwyp87yvUrNqPd6u+KznFjVtR9ah9E05cAfZ10fud\ncdXJfD1Ngu4DTLxrV6H+prVxBVhcl3iSNZGJJNk/q3K169Frms2Fr3owYMfcd8oT\ntPYeVWgyq7rcGaoUtpoyh3w/2UInJAU7jukNsD877O5RCe1uqNhv9FeXAoGAWfED\nSQ36D2Vv1ctg6AOp9aR+VwYIle/JbrcEYyngPc0rdvJiD8EDMnOapMabs5x6Iks2\nVzNt5fybdPt5+WCX1T+I/3E+NysZvei0WqMcXufXHo13H3pzP/2ZDhAQl6ruvehJ\ndNXtqVfqL2eUrGNAg9csw5Dy2jUiAyusV9FgskkCgYEAnYfMp3pxLGM8P31VzgRu\ncMrHYdoVX0vbi8gZUHqjm8tXU/sveS3eIwlBW6XbR6tjRJkprcc2079HcRygMShh\nx0SwYOavY6H2Y9WI5/BK7AQlOc3V79gDsNFY4vSCBTCTHTvSDIe98LOvh1r69ipR\nDIJPVZ9z5IakChp3GShZzq0=\n-----END PRIVATE KEY-----\n",
  "client_email": "translations@fhirfli-401119.iam.gserviceaccount.com",
  "client_id": "107245237830083643053",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url":
      "https://www.googleapis.com/robot/v1/metadata/x509/translations%40fhirfli-401119.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
};

/// https://docs.google.com/spreadsheets/d/1vZM63pLvaHq8asNdOPoOEai-Ux96mboE84Qm9ir3BHI/edit#gid=0
const translationSheetId = '1vZM63pLvaHq8asNdOPoOEai-Ux96mboE84Qm9ir3BHI';
