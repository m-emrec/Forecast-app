import 'package:http/http.dart';

class HttpResponseClass<T> {
  final T data;
  final Response response;

  HttpResponseClass(this.data, this.response);
}
