class Scanner {
  static Scanner? _instance;
  bool _locked;

  Scanner._() : _locked = false;

  factory Scanner() {
    _instance ??= Scanner._();
    return _instance!; 
  }

  lock() => _locked = true;
  unlock() => _locked = false;
  locked() => _locked;
}