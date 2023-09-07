sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ChangeNewPasswordSuffixIcon extends ForgetPasswordState {}

final class ChangeConfirmPasswordSuffixIcon extends ForgetPasswordState {}

final class SendCodeLoadingState extends ForgetPasswordState {}

final class SendCodeSucssState extends ForgetPasswordState {
  final String message;

  SendCodeSucssState(this.message);
}

final class SendCodeErrorState extends ForgetPasswordState {
  final String message;

  SendCodeErrorState(this.message);
}
