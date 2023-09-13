// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather/core/constants/logger.dart';

class ErrorManager {
  final String? exception;
  ErrorManager({
    this.exception = "",
  });

  errorConverter(String exception) {
    final Map _errorMap = {
      "ClientException with SocketException:":
          "Please Check Your Internet Connection."
    };
    bool _isKnownError =
        _errorMap.keys.where((element) => exception.contains(element)).isEmpty;

    if (!_isKnownError) {
      int i = -1;
      _errorMap.keys.firstWhere((element) {
        i++;
        return exception.contains(element);
      });
      String _errorMsg = _errorMap[_errorMap.keys.elementAt(i)];

      return _errorMsg;
    } else {}
    return "An Error Occured Please Try Again";
  }
}
