class BaseState {}

class BaseInitial extends BaseState {}

class BaseLoading<T> extends BaseState {}

class BaseLoaded<T> extends BaseState {
  final T response;
  BaseLoaded({required this.response});
}

class BaseError<String> extends BaseState {
  final String? message;
  BaseError({this.message});
}
