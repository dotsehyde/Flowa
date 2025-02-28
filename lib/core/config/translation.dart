import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //English
        "en": {
          "otp_title": "Enter OTP Code",
          "otp_subtitle": "Enter the 6-digit verification sent to",
        },
        //French
        "fr": {
          "otp_title": "Entrez le code OTP",
          "otp_subtitle": "Entrez les 6 chiffres de vérification envoyés à",
        },
        //Spanish
        "es": {
          "otp_title": "Ingrese el código OTP",
          "otp_subtitle": "Ingrese la verificación de 6 dígitos enviada a",
        }
      };
}
