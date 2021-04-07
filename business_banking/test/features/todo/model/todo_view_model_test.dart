import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:test/test.dart';

void main() {
  test("TodoViewModel should be created with the given values", () {
    final vm = TodoViewModel(name: "name", id: 0);
    expect(vm.name, "name");
    expect(vm.id, 0);
  });

  test("Two identical view models should be equal", () {
    final model = TodoViewModel(name: "name", id: 0);
    final other = TodoViewModel(name: "name", id: 0);
    expect(other, model);
  });
}
