import 'package:dio/dio.dart';

sealed class DataState<T> {
  factory DataState.success(T data) = DataSuccess;
  factory DataState.error(DioException error) = DataFailed;
}

class DataSuccess<T> implements DataState<T> {
  final T data;
  const DataSuccess(this.data);
}

class DataFailed<T> implements DataState<T> {
  final DioException? error;
  const DataFailed(this.error);
}