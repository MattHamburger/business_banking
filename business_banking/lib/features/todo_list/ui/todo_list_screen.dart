import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/todo_list/model/todo_list_view_model.dart';
import 'package:business_banking/features/todo_list/model/todo_task_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TodoListScreen extends Screen {
  final TodoListViewModel viewModel;

  TodoListScreen({required this.viewModel})
      : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              "Todo List",
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for ( var i = 0; i < viewModel.allTodoTasks.length; i++)
          TodoListCard(
            viewModel: viewModel.allTodoTasks.elementAt(i),
            key: Key('todoListCard${i}'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class TodoListCard extends StatelessWidget {
  const TodoListCard({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final TodoTaskEntity viewModel;

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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            viewModel.task,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Delete',
                              style: TextStyle(color: Colors.white,fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        viewModel.description,
                        style: TextStyle(
                          fontSize: 18.0,
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
