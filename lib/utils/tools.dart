import 'package:decimal/decimal.dart';

String getFormat(Decimal tokenPrice) {
  return tokenPrice > Decimal.one ? '0.0' : '0.00000';
}
