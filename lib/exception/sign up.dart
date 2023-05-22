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
class SigninEmailWithPasswordfaliure {

  final String messsage;


  const SigninEmailWithPasswordfaliure(
      [this.messsage = "An unknown error occured."]);

  factory SigninEmailWithPasswordfaliure.code(String code) {
    switch (code) {
      case 'weak-password ':
        return SigninEmailWithPasswordfaliure('please enter a strong passwprd');
      case ' ':
        return SigninEmailWithPasswordfaliure('');
      case ' ':
        return SigninEmailWithPasswordfaliure('');
      case ' ':
        return SigninEmailWithPasswordfaliure('');
      case ' ':
        return SigninEmailWithPasswordfaliure('');
      default:
        return SigninEmailWithPasswordfaliure();
    }
  }
}
