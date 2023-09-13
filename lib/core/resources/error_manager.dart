// ignore_for_file: public_member_api_docs, sort_constructors_first
class ErrorManager {
  final String? exception;
  ErrorManager({
    this.exception = "",
  });

  errorConverter(String exception) {
    switch (exception) {
      case "value":
        break;
      default:
        return "An error occured . Please try again.";
    }
  }
}
