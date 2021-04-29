import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import '../../model/todo_list_view_model.dart';

class TodoHubScreen extends Screen {
  final TodoListViewModel viewModel;
  final VoidCallback navigateToTodoList;

  TodoHubScreen({required this.viewModel, required this.navigateToTodoList})
      : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          child: TodoHubCard(
            viewModel: viewModel,
            key: Key('todoHubCard'),
          ),
          onTap: () {
            navigateToTodoList();
          },
        )
      ],
    );
  }
}

class TodoHubCard extends StatelessWidget {
  const TodoHubCard({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final TodoListViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Task To Do: ",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        viewModel.allTodoTasks.length.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
