//{"date" : "dd/mm/aaaa hh:mm:ss", "temp" : 69, "uid" : 1}
class Dados{
  String _date;
  double _temp;
  int _uid;
  int _umidade;

  Dados(this._date, this._temp, this._uid, this._umidade);

  int get uid => _uid;

  set uid(int value) {
    _uid = value;
  }

  double get temp => _temp;

  set temp(double value) {
    _temp = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  int get umidade => _umidade;

  set umidade(int value) {
    _umidade = value;
  }
}

