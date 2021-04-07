import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:business_banking/features/todo/model/todo_view_model_list.dart';
import 'package:test/test.dart';

void main() {
  test("TodoViewModelList should create based on inputs", () {
    final vml = TodoViewModelList([TodoViewModel(name: "name", id: 0)]);
    expect(vml.viewModels.length, 1);
    expect(vml.viewModels[0].name, "name");
    expect(vml.viewModels[0].id, 0);
  });

  test("two viewModelLists with the same properties, should be equal", () {
    final vml = TodoViewModelList(
        List.generate(5, (i) => TodoViewModel(name: "todo$i", id: i)));
    final other = TodoViewModelList(
        List.generate(5, (i) => TodoViewModel(name: "todo$i", id: i)));
    expect(vml, other);
  });
}
