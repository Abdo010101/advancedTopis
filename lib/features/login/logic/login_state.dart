import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  // why i put _ in inital cause i need to priveate and i did not use it
  // the class that start with small letter we will use them in //!cubit
  //! the class that start with capitcal letter we will use them in buidWhen in state
  const factory LoginState.initial() = _Inital;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(T data) = Success<T>;
  const factory LoginState.error({required String error}) = Error;
}
