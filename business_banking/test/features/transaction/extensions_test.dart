import 'package:test/test.dart';
import 'package:business_banking/features/transaction/extensions.dart';

void main() {
  test('Word should be capitalized', () {
    final String wordToCapitalize = 'word';

    expect(wordToCapitalize.capitalize(), 'Word');
  });
}