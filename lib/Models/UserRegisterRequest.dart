class UserRegisterRequest {
  final String Email;
  final String Password;
  final String ConfirmPassword;

  UserRegisterRequest(
      {required this.Email,
      required this.Password,
      required this.ConfirmPassword});

  Map<String, dynamic> toJson() {
    return {
      'Email': Email,
      'Password': Password,
      'ConfirmPassword': ConfirmPassword,
    };
  }
}
