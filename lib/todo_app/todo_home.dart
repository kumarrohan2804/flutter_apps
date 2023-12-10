import 'package:flutter/material.dart';
import 'package:flutter_apps/todo_app/widget/todo_item.dart';
import '../todo_app/model/todo_item_model.dart';

class TodoHome extends StatefulWidget {
  TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final todoItemController = TextEditingController();

  final todoItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        color: const Color(0xffF8F6F4),
        child: Column(
          children: [
            _searchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 20),
                    child: const Text(
                      'All Todos', 
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      for(final todo in todoItemList) 
                        TodoItem(
                          item: todo.item, 
                          id: todo.id, 
                          completed: todo.completed, 
                          callback: toggleTodo,
                          onDelete: removeTodo,
                        )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void stateChange(){
    setState(() {});
  }

  void toggleTodo(int? id){
    for(TodoItemModel todo in todoItemList){
      if(todo.id == id){
        todo.completed = !(todo.completed ?? false);
      }
    }
    stateChange();
  }

  void removeTodo(int? id){
    todoItemList.removeWhere((element) => element.id == id);
    stateChange();
  }

  Widget _searchBox(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        onSubmitted: (value){
          print("the todo item is $value");
          final todo = TodoItemModel(
            item: value, 
            completed: false, 
            id: todoItemList.length + 1
          );
          todoItemList.add(todo);
          todoItemController.text ='';
          stateChange();
        },
        controller: todoItemController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter the Item ....',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          )
        ),
        textInputAction: TextInputAction.search,
      ),
    );
  }

  AppBar get _appBar => AppBar(
    backgroundColor: Colors.blueGrey,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/avatar.png'),
            ),
          )
        ],
      ),
    );
}