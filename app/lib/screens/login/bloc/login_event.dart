part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

class UsernameChangeEvent extends LoginEvent {
  final String username;

  const UsernameChangeEvent({required this.username});
}

class PasswordChangeEvent extends LoginEvent {
  final String password;

  const PasswordChangeEvent({required this.password});
}

class SaveAccountEvent extends LoginEvent {}

class LoginSubmitFormEvent extends LoginEvent {}

class AutoFillCreatedUserEvent extends LoginEvent {
  final String username;
  final String password;

  const AutoFillCreatedUserEvent(
      {required this.username, required this.password});
}
