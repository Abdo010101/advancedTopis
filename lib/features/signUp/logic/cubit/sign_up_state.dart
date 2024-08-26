import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState<T> with _$SignUpState {
  // why i put _ in inital cause i need to priveate and i did not use it
  // the class that start with small letter we will use them in //!cubit
  //! the class that start with capitcal letter we will use them in buidWhen in state
  const factory SignUpState.intial() = _Inital;
  const factory SignUpState.loading() = Loading;

  const factory SignUpState.success(T data) = Success<T>;
  const factory SignUpState.error({required String error}) = Error;

  const factory SignUpState.chnagePasswordVisiblity() = ChangePasswordVisiblity;
  const factory SignUpState.chnageConfirmPasswordVisiblity() =
      ChangeConfirmPasswordVisiblity;

  const factory SignUpState.getUserDataFromApiOrCachedLoading() =
      GetUserDataFromApiOrCachedLoading;
  const factory SignUpState.getUserDataFromApiOrCachedSuccess(T data) =
      GetUserDataFromApiOrCachedSuccess<T>;
  const factory SignUpState.getUserDataFromApiOrCachedError(
      {required String error}) = GetUserDataFromApiOrCachedError;
}
