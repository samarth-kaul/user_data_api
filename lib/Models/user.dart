class User {
  String Email;
  String Password;

  User(this.Email, this.Password) {
    if (Email.isEmpty) {
      throw ArgumentError('Email cannot be empty');
    }
    if (Password.isEmpty) {
      throw ArgumentError('Password cannot be empty');
    }
  }

  // Factory constructor for creating a User object from a map (e.g., JSON)
  factory User.fromJson(Map<String, dynamic> json) {
    final email = json['email'] as String;
    final password = json['password'] as String;
    return User(email, password);
  }

  // Method to convert User object to a map (e.g., for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'email': Email,
      'password': Password,
    };
  }
}
