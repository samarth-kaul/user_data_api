class UserLoginRequest {
  final String Email;
  final String Password;

  UserLoginRequest({required this.Email, required this.Password});

  Map<String, String> toJson() {
    return {
      'Email': Email,
      'Password': Password,
    };
  }
}