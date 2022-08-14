import 'dart:math';

class DocumentModel {
  DocumentModel() {
    _digits = _generateDocument();
    _value = _digits.join();
  }

  List<int> _digits = [];
  String _value = '';

  String get value => _value;
  String get formattedValue {
    String value = _digits.sublist(0, 3).join('');
    value += '.${_digits.sublist(3, 6).join('')}';
    value += '.${_digits.sublist(6, 9).join('')}';
    value += '-${_digits.sublist(9).join('')}';

    return value;
  }

  int _generateValidatorDigit(List<int> collection) {
    int index = 0;
    int digit = 0;

    for (int x = collection.length + 1; x >= 2; x--) {
      digit += collection[index] * x;

      index++;
    }

    digit = (digit * 10) % 11;

    return digit == 10 ? 0 : digit;
  }

  List<int> _generateDocument() {
    var digits = List.generate(9, (index) => Random().nextInt(10));

    var firstValidatorDigit = _generateValidatorDigit(digits);
    digits.add(firstValidatorDigit);
    var secondValidatorDigit = _generateValidatorDigit(digits);
    digits.add(secondValidatorDigit);

    return digits;
  }

  @override
  String toString() {
    return 'CPF: $value';
  }
}
