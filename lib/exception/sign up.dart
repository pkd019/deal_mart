class SignupEmailWithPasswordfaliure {

  final String messsage;


  const SignupEmailWithPasswordfaliure(
      [this.messsage = "An unknown error occured."]);

  factory SignupEmailWithPasswordfaliure.code(String code) {
    switch (code) {
      case 'weak-password ':
        return SignupEmailWithPasswordfaliure('please enter a strong passwprd');
      case ' ':
        return SignupEmailWithPasswordfaliure('');
      case ' ':
        return SignupEmailWithPasswordfaliure('');
      case ' ':
        return SignupEmailWithPasswordfaliure('');
      case ' ':
        return SignupEmailWithPasswordfaliure('');
      default:
        return SignupEmailWithPasswordfaliure();
    }
  }
}
