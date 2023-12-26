class Scanner {
  static Scanner? _instance;
  bool _locked;

  Scanner._() : _locked = false;

  factory Scanner() {
    _instance ??= Scanner._();
    return _instance!; 
  }

  void lock() => _locked = true;
  void unlock() => _locked = false;
  bool locked() => _locked;
}