abstract class LoginState{}
//state for passeord
class VisabilityState extends LoginState{}
class UnvisabilityState extends LoginState{}

//login
class InitialState extends LoginState{}
class SuccessState extends LoginState{}
class IsLoadingState extends LoginState{}
class FailureState extends LoginState{
  String? errorMessage;

  FailureState({this.errorMessage});
}

//request pass
class IsLoadingRequestPass extends LoginState{}
class SuccessRequestPass extends LoginState{}
class FailureRequestPass extends LoginState{
  String? errorMessage;
  FailureRequestPass({this.errorMessage});
}

//resetpassword
class IsLoadingResetPassword extends LoginState{}
class SuccessResetPassword extends LoginState{}
class FailureResetPassword extends LoginState{
  String? errorMessage;
  FailureResetPassword({this.errorMessage});
}