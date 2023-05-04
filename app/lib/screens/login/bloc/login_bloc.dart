import 'package:app/repository/repos.dart';
import 'package:app/screens/login/bloc/form_submission_status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      if (event is UsernameChangeEvent) {
        emit(state.copyWith(username: event.username));
      } else if (event is PasswordChangeEvent) {
        emit(state.copyWith(password: event.password));
      } else if (event is LoginSubmitFormEvent) {
        emit(state.copyWith(formStatus: FormSubmitting()));
        try {
          final token = await ApiRepository.accountRepo
              .requestLogin(state.username, state.password);
          print(token);
          emit(state.copyWith(formStatus: FormSubmissionSuccess()));
        } on Exception catch (e) {
          emit(state.copyWith(formStatus: FormSubmissionFail(e: e)));
        }
      }
    });
  }
}
