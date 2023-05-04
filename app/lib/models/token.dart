class Token {
  final String? access;
  final String? refresh;
  final String? type;
  final String? expiresIn;

  Token(this.access, this.refresh, this.type, this.expiresIn);

  @override
  String toString() {
    return "{'access': $access, 'refresh': $refresh, 'type': $type, 'expireIn': $expiresIn}";
  }

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(json["access_token"], json["refresh_token"],
        json["token_type"], json["expires_in"]);
  }
}
