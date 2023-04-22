class Token {
  String? _access;
  String? _refresh;
  String? _type;
  int? _expireIn;

  @override
  String toString() {
    return "{'access': $_access, 'refresh': $_refresh, 'type': $_type, 'expireIn': $_expireIn}";
  }
}
