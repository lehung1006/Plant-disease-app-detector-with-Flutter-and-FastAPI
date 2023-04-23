class Token {
  final String? access;
  final String? refresh;
  final String? type;
  final int? expireIn;

  Token({this.access, this.refresh, this.type, this.expireIn});

  @override
  String toString() {
    return "{'access': $access, 'refresh': $refresh, 'type': $type, 'expireIn': $expireIn}";
  }

  factory Token.fromJson(Map<String,dynamic> json) {
    return Token();
  }
}
