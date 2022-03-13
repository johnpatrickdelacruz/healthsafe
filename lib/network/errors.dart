import '../../values/strings.dart' as strings;

enum Errors {
  Generic,
  NoNetwork,
  ApplicationNotFound,
  NoActiveRooms,
}

extension ErrorExtension on Errors {
  String get errorMessage {
    switch (this) {
      case Errors.Generic:
        return strings.errorGeneric;
      case Errors.NoNetwork:
        return strings.errorNoInternet;

      default:
        return strings.errorGeneric;
    }
  }
}
