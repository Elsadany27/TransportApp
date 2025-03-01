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