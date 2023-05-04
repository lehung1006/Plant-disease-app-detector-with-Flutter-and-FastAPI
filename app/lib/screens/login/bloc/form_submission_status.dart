abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class FormSubmissionSuccess extends FormSubmissionStatus {}

class FormSubmissionFail extends FormSubmissionStatus {
  final Exception e;

  FormSubmissionFail({required this.e});
}

class GetSavedAccountSuccess extends FormSubmissionStatus {}