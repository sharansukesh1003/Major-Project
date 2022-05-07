class LoginMessageSuccess {
  LoginMessageSuccess({
    required this.message, 
    required this.token, 
    required this.id,
    required this.authentication});
  String message;
  String token;
  String id;
  bool authentication;
}
class LoginMessageFail {
  LoginMessageFail({
    required this.message, 
    required this.authentication});
  String message;
  bool authentication;
}

class SignUpMessage {
  SignUpMessage({
    required this.message, 
    required this.success
  });
  String message;
  bool success;
}