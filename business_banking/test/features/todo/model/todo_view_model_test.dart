import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:test/test.dart';

void main() {
  test('TodoViewModel initialize', () async {
    final viewModel = TodoViewModel(
      count: 10,
    );

    expect(viewModel.count, 10);
  });
}
