// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

abstract class DataState<T> {
  final T? data;
  final String? exception;
  DataState({
    this.data,
    this.exception,
  });
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(exception) : super(exception: exception);
}
