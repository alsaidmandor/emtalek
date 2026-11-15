class UserSharedPref {
  static final UserSharedPref _instance = UserSharedPref._internal();
  factory UserSharedPref() => _instance;
  UserSharedPref._internal();

  String? _token;

  String? getToken() => _token;

  void setToken(String? token) {
    _token = token;
  }
}
